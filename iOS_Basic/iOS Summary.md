iOS

iOS知识点小结
* https://cnbin.github.io/blog/2016/03/23/ioszhi-shi-dian-xiao-jie/

# NSNotification

## NSNotificationCenter // single thread

### sync will block sending methods. If async send, use "notification queue".
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

## NSDistributedNotificationCenter // multiple threads

![alt text][notificationQueue]
[notificationQueue]: https://github.com/danielkong/iOS_2017/blob/master/iOS_Basic/notificationQueue.png


