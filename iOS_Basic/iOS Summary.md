iOS知识点小结
* https://cnbin.github.io/blog/2016/03/23/ioszhi-shi-dian-xiao-jie/

# [NSNotification with link](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Notifications/Articles/Notifications.html#//apple_ref/doc/uid/20000215-BCICIHGE)
## [iOS Push notification](http://www.jianshu.com/p/a70b77cbdfd2)

1. NSNotificationCenter (single thread) _Deliver notifications on the thread in which the notification was posted._

  * sync will block sending methods. If async send, use "notification queue".

    Send Methods:
    ```
    - (void)postNotification:(NSNotification *)notification;
    - (void)postNotificationName:(NSString *)aName object:(id)anObject;
    - (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
    ```
    Register Methods:
    ```
    - (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
    - (void)removeObserver:(id)observer;
    - (void)removeObserver:(id)observer name:(NSString *)aName object:(id)anObject;
    ```

2. NSDistributedNotificationCenter (multiple threads) _Deliver notifcations on the main thread_

    ![alt text][notificationQueue]
[notificationQueue]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/notificationQueue.png

    * Each notification center/thread could have multiple notification queues.

    ```
    - (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle;
    - (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle coalesceMask:(NSUInteger)coalesceMask forModes:(NSArray *)modes;
    ```

      * Async sending:
        * Posting Style:
            1. asap _// posted at the end of current notif callout or timer._
            2. whenIdle _// post when run loop is idle._
            3. now  _// posted immediately after coalescing._
      * Coalesce Notification: _The server queues only the last notification of the specified name and object; earlier notifications are dropped._

3. Delivering Notifications To Particular Threads. _Sometimes would like to receive the notifications in the background thread instead of the main thread. must capture the notifications as they are delivered on the default thread and redirect them to the appropriate thread._ 
    
    * Use custom notification queue (not `NSNotificationQueue` object) to hold received notification and proess them on the correct thread.
        - *register* for a notif normally.
            ```
            @interface MyThreadedClass: NSObject
            /* Threaded notification support. */
            @property NSMutableArray *notifications;
            @property NSThread *notificationThread;
            @property NSLock *notificationLock;
            @property NSMachPort *notificationPort;
             
            - (void) setUpThreadingSupport;
            - (void) handleMachMessage:(void *)msg;
            - (void) processNotification:(NSNotification *)notification;
            @end
            ```
            ```
            - (void) setUpThreadingSupport {
                if (self.notifications) {
                    return;
                }
                self.notifications      = [[NSMutableArray alloc] init];
                self.notificationLock   = [[NSLock alloc] init];
                self.notificationThread = [NSThread currentThread];
             
                self.notificationPort = [[NSMachPort alloc] init];
                [self.notificationPort setDelegate:self];
                [[NSRunLoop currentRunLoop] addPort:self.notificationPort
                        forMode:(NSString __bridge *)kCFRunLoopCommonModes];
            }
            ```
            ```
            - (void) handleMachMessage:(void *)msg {
 
                [self.notificationLock lock];
             
                while ([self.notifications count]) {
                    NSNotification *notification = [self.notifications objectAtIndex:0];
                    [self.notifications removeObjectAtIndex:0];
                    [self.notificationLock unlock];
                    [self processNotification:notification];
                    [self.notificationLock lock];
                };
             
                [self.notificationLock unlock];
            }
            ```
        - test whether current thread, if wrong, *store it in a queue* and *send a singal to correct thread*, indicating that a notification needs processing.

            ```
            - (void)processNotification:(NSNotification *)notification {
                if ([NSThread currentThread] != notificationThread) {
                    // Forward the notification to the correct thread.
                    [self.notificationLock lock];
                    [self.notifications addObject:notification];
                    [self.notificationLock unlock];
                    [self.notificationPort sendBeforeDate:[NSDate date]
                            components:nil
                            from:nil
                            reserved:0];
                }
                else {
                    // Process the notification here;
                }
            }
            ```
        - *Other thread* reveives the signal, *removes* the notif from the queue and process notification.

            ```
            [self setupThreadingSupport];
            [[NSNotificationCenter defaultCenter]
                    addObserver:self
                    selector:@selector(processNotification:)
                    name:@"NotificationName"
                    object:nil];
            ```

# [Submitting App to Store](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/SubmittingYourApp/SubmittingYourApp.html)

[raywenderlich link](https://www.raywenderlich.com/127936/submit-an-app-part-1)

1. Certificates, IDs & Profiles
    * Generate profiles(called "code signing identites" as well)
        - Development profiles _(tie to specific devices)_
        - Distribution profiles _(sign your app before submitting to Apple)_
    * Generate **push notification certificates**

2. iTunes Connect
    * use to submit an app. 
        -  register a new app
        -  enter the app’s description and screenshots
        -  choose the price
        -  configure game center
        -  in-app purchases

