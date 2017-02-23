//
//  ViewController.m
//  Backgroundtask
//
//  Created by Bablu Joshi on 23/02/17.
//  Copyright © 2017 DB Corp Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *playbackTimer;
    UIBackgroundTaskIdentifier task;
    int i;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self beginBackgroundUpdateTask];
    
    i =0;
    playbackTimer=[NSTimer scheduledTimerWithTimeInterval:0.5
                                                   target:self
                                                 selector:@selector(myMethod)
                                                 userInfo:nil
                                                  repeats:YES];
    
}



-(void)myMethod{

    [self.label setText:[NSString stringWithFormat:@"%d",++i]];
    
}


- (void) beginBackgroundUpdateTask
{
    task = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

- (void) endBackgroundUpdateTask
{
    
    if ([playbackTimer isValid]) {
        [playbackTimer invalidate];

    }
    [[UIApplication sharedApplication] endBackgroundTask: task];
    task = UIBackgroundTaskInvalid;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
