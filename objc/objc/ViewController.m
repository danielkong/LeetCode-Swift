//
//  ViewController.m
//  objc
//
//  Created by Daniel Kong on 8/9/17.
//  Copyright © 2017 Xianglong Kong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self dispatchQueueSyncAsync];
    [self dispatch_semaphore];
    
    /**
     NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:@[@3, @0, @1, @2, @0]];
     [self moveZero: arr];
     NSLog(@"%@", arr);
     */

}

-(void)dispatch_semaphore
{
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    __block long x = 0;
    NSLog(@"0_x:%ld",x);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        NSLog(@"waiting");
        x = dispatch_semaphore_signal(signal);
        NSLog(@"1_x:%ld",x);
        
        sleep(2);
        NSLog(@"waking");
        x = dispatch_semaphore_signal(signal);
        NSLog(@"2_x:%ld",x);
    });
//    dispatch_time_t duration = dispatch_time(DISPATCH_TIME_NOW, 1*1000*1000*1000); //超时1秒
//    dispatch_semaphore_wait(signal, duration);
    
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"3_x:%ld",x);
    
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"wait 2");
    NSLog(@"4_x:%ld",x);
    
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"wait 3");
    NSLog(@"5_x:%ld",x);
    
}
/**
 2017-09-04 15:45:25.632 objc[59282:11551113] 0_x:0
 2017-09-04 15:45:25.632 objc[59282:11551113] 3_x:0
 2017-09-04 15:45:26.633 objc[59282:11551204] waiting
 2017-09-04 15:45:26.634 objc[59282:11551204] 1_x:1
 2017-09-04 15:45:26.634 objc[59282:11551113] wait 2
 2017-09-04 15:45:26.634 objc[59282:11551113] 4_x:0
 2017-09-04 15:45:28.639 objc[59282:11551204] waking
 2017-09-04 15:45:28.640 objc[59282:11551204] 2_x:1
 2017-09-04 15:45:28.640 objc[59282:11551113] wait 3
 2017-09-04 15:45:28.640 objc[59282:11551113] 5_x:0
 */

- (void)dispatchQueueSyncAsync {
    dispatch_queue_t myCustomQueue;
    myCustomQueue = dispatch_queue_create("com.example.MyCustomQueue", NULL);
    
    dispatch_async(myCustomQueue, ^{
        printf("Do some work here.\n");
    });
    
    printf("The first block may or may not have run.\n");
    
    dispatch_sync(myCustomQueue, ^{
        printf("Do some more work here.\n");
    });
    printf("Both blocks have completed.\n");

}


- (void)moveZero:(NSMutableArray *)arr {
    int index = 0;
    for (int i=0; i<arr.count; i++) {
        if ([arr[i] intValue] != 0) {
            arr[index++] = arr[i];
        } else {
            continue;
        }
    }
    
    while (index < arr.count) {
        arr[index++] = @0;
    }
    NSLog(@"%@", arr);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
