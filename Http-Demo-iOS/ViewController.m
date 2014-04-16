//
//  ViewController.m
//  Http-Demo-iOS
//
//  Created by Chris Vanderschuere on 4/15/14.
//  Copyright (c) 2014 cdvconcepts. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"http://corvallis-bus.appspot.com/routes"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            NSError *jsonError = nil;
            NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError != nil) {
                // Bad JSON -- weird
            }
            
            // Check out response values
            for (NSDictionary *route in responseDict[@"routes"]) {
                NSLog(@"Route: %@",route[@"Name"]);
            }
        }else{
            NSLog(@"Error: %@",error);
        }
    }] resume];
  
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
