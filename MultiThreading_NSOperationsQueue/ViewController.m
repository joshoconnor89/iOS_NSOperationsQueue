//
//  ViewController.m
//  MultiThreading_NSOperationsQueue
//
//  Created by Joshua O'Connor on 4/27/16.
//  Copyright © 2016 Joshua O'Connor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Create a new NSOperationQueue instance.
    operationQueue = [NSOperationQueue new];
    
    // Create a new NSOperation object using the NSInvocationOperation subclass.
    // Tell it to run the counterTask method.
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(counterTask) object:nil];
    
    // Add the operation to the queue and let it to be executed.
    [operationQueue addOperation:operation];
    
    // The same story as above, just tell here to execute the colorRotatorTask method.
    operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                     selector:@selector(colorRotatorTask)
                                                       object:nil];
    [operationQueue addOperation:operation];
}


-(void)counterTask{
    // Make a BIG loop and every 100 steps let it update the label1 UILabel with the counter's value.
    for (int i=0; i<10000000; i++) {
        if (i % 100 == 0) {
            // Notice that we use the performSelectorOnMainThread method here instead of setting the label's value directly.
            // Since we are running this on a background thread, we need to perform things on the main thread when we are done.
            // We do that to let the main thread to take care of showing the text on the label
            // and to avoid display problems due to the loop speed.
            [_label1 performSelectorOnMainThread:@selector(setText:)
                                     withObject:[NSString stringWithFormat:@"%d", i]
                                  waitUntilDone:YES];
        }
    }
    
    // When the loop gets finished then just display a message.
    [_label1 performSelectorOnMainThread:@selector(setText:) withObject:@"Thread #1 has finished." waitUntilDone:NO];
}

-(void)colorRotatorTask{
    // We need a custom color to work with.
    UIColor *customColor;
    
    // Run a loop with 500 iterations.
    for (int i=0; i<500; i++) {
        // Create three float random numbers with values from 0.0 to 1.0.
        float redColorValue = (arc4random() % 100) * 1.0 / 100;
        float greenColorValue = (arc4random() % 100) * 1.0 / 100;
        float blueColorValue = (arc4random() % 100) * 1.0 / 100;
        
        // Create our custom color. Keep the alpha value to 1.0.
        customColor = [UIColor colorWithRed:redColorValue green:greenColorValue blue:blueColorValue alpha:1.0];
        
        // Change the label2 UILabel's background color.
        [_label2 performSelectorOnMainThread:@selector(setBackgroundColor:) withObject:customColor waitUntilDone:YES];
        
        // Set the r, g, b and iteration number values on label3.
        [_label3 performSelectorOnMainThread:@selector(setText:)
                                 withObject:[NSString stringWithFormat:@"Red: %.2f\nGreen: %.2f\nBlue: %.2f\nIteration #: %d", redColorValue, greenColorValue, blueColorValue, i]
                              waitUntilDone:YES];
        
        // Put the thread to sleep for a while to let us see the color rotation easily.
        [NSThread sleepForTimeInterval:0.4];
    }
    
    // Show a message when the loop is over.
    [_label3 performSelectorOnMainThread:@selector(setText:) withObject:@"Thread #2 has finished." waitUntilDone:NO];
}

- (IBAction)applyBackgroundColor1:(id)sender {
    [self.view setBackgroundColor:[UIColor blueColor]];
}

- (IBAction)applyBackgroundColor2:(id)sender {
    [self.view setBackgroundColor:[UIColor greenColor]];
}

- (IBAction)applyBackgroundColor3:(id)sender {
    [self.view setBackgroundColor:[UIColor whiteColor]];
}
@end
