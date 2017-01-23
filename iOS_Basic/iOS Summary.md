iOS知识点小结
* https://cnbin.github.io/blog/2016/03/23/ioszhi-shi-dian-xiao-jie/

# [NSNotification with link](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Notifications/Articles/Notifications.html#//apple_ref/doc/uid/20000215-BCICIHGE)

1. NSNotificationCenter (single thread)

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

2. NSDistributedNotificationCenter (multiple threads)

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

3. Delivering Notifications To Particular Threads 


