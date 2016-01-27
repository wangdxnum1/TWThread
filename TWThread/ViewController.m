//
//  ViewController.m
//  CFRunloopTest
//
//  Created by HaKim on 16/1/26.
//  Copyright © 2016年 haKim. All rights reserved.
//

#import "ViewController.h"
#import "TWThread.h"

@interface ViewController ()

@property (nonatomic, strong) TWThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    _thread = [[TWThread alloc]init];
//    [_thread start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)start:(UIButton *)sender {
    _thread = [[TWThread alloc]init];
    [_thread start];
    [_thread runWithTask:^{
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(task) userInfo:nil repeats:YES];
    }];
}
- (IBAction)stop:(UIButton *)sender {
    [_thread stop];
}

- (void)task
{
    NSLog(@"do my work on thread %@",[NSThread currentThread]);
}

- (NSString *)dateByAddingDays:(NSInteger)days
{
    NSDate *date = [NSDate date];
    NSTimeInterval dateIntInterval = [date timeIntervalSince1970];
    dateIntInterval += days * 86400;
    
    NSDate *newDate = [[NSDate alloc]initWithTimeIntervalSince1970:dateIntInterval];
    
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *formateTime = [dateformatter stringFromDate:newDate];
    NSLog(@"%@",formateTime);
    
    return formateTime;
}

@end
