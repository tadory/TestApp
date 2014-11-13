//
//  ViewController.h
//  Alermclock
//
//  Created by 田所　龍 on 2014/09/04.
//  Copyright (c) 2014年 田所　龍. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>{
    
    
    int hour;
    int minute;
    int second;
    
    IBOutlet UILabel * label1;
    IBOutlet UILabel *label2;
    IBOutlet UILabel *label3;
    
    IBOutlet UITextField *text1;
    IBOutlet UITextField *text2;
    
    NSTimer *timer ;
    
}

-(IBAction) settei;
-(IBAction) kaizyo;


@end
