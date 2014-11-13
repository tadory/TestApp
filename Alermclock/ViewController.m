//
//  ViewController.m
//  Alermclock
//
//  Created by 田所　龍 on 2014/09/04.
//  Copyright (c) 2014年 田所　龍. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    hour = 0;
    minute = 0;
    second = 0;
    
    label1.text=[NSString stringWithFormat:@"0"];
    label2.text=[NSString stringWithFormat:@"0"];
    label3.text=[NSString stringWithFormat:@"0"];
    
    
    text1.delegate=self;
    text2.delegate=self;
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)settei{
    hour=[text1.text intValue];
    minute=[text2.text intValue];
    second=0;
    
    label1.text=text1.text;
    label2.text=text2.text;
    label3.text=@"0";
    
    
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"お知らせ"
                                                  message:@"タイマーの設定が完了しました"
                                                 delegate:nil
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"OK",nil];
    [alert show];
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1
                                           target:self
                                         selector:@selector(count)
                                         userInfo:nil
                                          repeats:YES];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    
}

-(void)count
{
    second=second-1;
    
    
    
    if(second<0){
        second=59;
        minute=minute-1;
    }
    
        if(minute<0){
            minute=59;
            hour=hour-1;
        }
        
    
    label1.text=[NSString stringWithFormat:@"%d",hour];
    label2.text=[NSString stringWithFormat:@"%d",minute];
    label3.text=[NSString stringWithFormat:@"%d",second];
    
    if(hour==0 && minute<=0 && second<=0){
        UIAlertView *alert1=[[UIAlertView alloc] initWithTitle:@"お知らせ"
                                                       message:@"時間になりました"
                                                      delegate:nil
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"OK",nil];
        
        [alert1 show];
        
        [timer invalidate];
    }
}

-(IBAction)kaizyo{
    if([timer isValid]){
        [timer invalidate];
        hour=0;
        minute=0;
        second=0;
        label1.text=[NSString stringWithFormat:@"0"];
        label2.text=[NSString stringWithFormat:@"0"];
        label3.text=[NSString stringWithFormat:@"0"];
        
        UIAlertView *alert3=[[UIAlertView alloc] initWithTitle:@"お知らせ"
                                                      message:@"タイマーを解除しました"
                                                     delegate:nil
                                            cancelButtonTitle:nil
                                            otherButtonTitles:@"OK",nil];
        [alert3 show];

    }}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
