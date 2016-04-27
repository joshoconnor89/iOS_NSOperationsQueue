//
//  ViewController.h
//  MultiThreading_NSOperationsQueue
//
//  Created by Joshua O'Connor on 4/27/16.
//  Copyright © 2016 Joshua O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    NSOperationQueue *operationQueue;
}

@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;


- (IBAction)applyBackgroundColor1:(id)sender;
- (IBAction)applyBackgroundColor2:(id)sender;
- (IBAction)applyBackgroundColor3:(id)sender;

-(void)counterTask;
-(void)colorRotatorTask;

@end

