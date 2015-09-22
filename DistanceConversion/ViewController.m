//
//  ViewController.m
//  DistanceConversion
//
//  Created by Anand Kumar on 21/09/2015.
//  Copyright © 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import  <DistanceGetter/DGDistanceRequest.h>

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)calculateButtonTapped:(id)sender {
    
    self.calculateDistance.enabled=NO;
    
    self.req = [DGDistanceRequest alloc];
    
    NSString *start = self.startLocation.text;
    NSString *destA = self.endLocationA.text;
    NSString *destB = self.endLocationB.text;
    NSString *destC = self.endLocationC.text;
    NSString *destD = self.endLocationD.text;
    
    NSArray *dests = @[destA,destB,destC,destD];
    
  self.req =  [self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    
    __weak ViewController *weakSelf = self;
    
    
    self.req.callback = ^void(NSArray *responses){
        
        ViewController *strongSelf = weakSelf;
        
        if(!strongSelf) return;
        
       
        
        NSNull *badResult = [NSNull null];
        
        if(responses[0] != badResult)
        {
            double num;
           
            
            if(strongSelf.controller.selectedSegmentIndex==0)
            {
                
                num  = ([responses[0] floatValue]/1.0);
                NSString *locationA = [NSString stringWithFormat:@"%.2f m", num];
                
                strongSelf.distanceA.text = locationA;
                
                
                num  = ([responses[1] floatValue]/1.0);
                NSString *locationB = [NSString stringWithFormat:@"%.2f m", num];
                
                strongSelf.distanceB.text = locationB;
                
                
                num  = ([responses[2] floatValue]/1.0);
                NSString *locationC = [NSString stringWithFormat:@"%.2f m", num];
                
                strongSelf.distanceC.text = locationC;

                num  = ([responses[3] floatValue]/1.0);
                NSString *locationD = [NSString stringWithFormat:@"%.2f m", num];
                
                strongSelf.distanceD.text = locationD;

                
                
                
            }
            else if (strongSelf.controller.selectedSegmentIndex == 1)
            {
               num  = ([responses[0] floatValue]/1000.0);
                NSString *locationA = [NSString stringWithFormat:@"%.2f km", num];
                
                strongSelf.distanceA.text = locationA;
                
                
                num  = ([responses[1] floatValue]/1000.0);
                NSString *locationB = [NSString stringWithFormat:@"%.2f km", num];
                
                strongSelf.distanceB.text = locationB;
                
                num  = ([responses[2] floatValue]/1000.0);
                NSString *locationC = [NSString stringWithFormat:@"%.2f km", num];
                
                strongSelf.distanceC.text = locationC;
                
                num  = ([responses[3] floatValue]/1000.0);
                NSString *locationD = [NSString stringWithFormat:@"%.2f km", num];
                
                strongSelf.distanceD.text = locationD;
                
            }
            else if (strongSelf.controller.selectedSegmentIndex == 2)
            {
                num  = ([responses[0] floatValue]/1609.34);
                NSString *locationA = [NSString stringWithFormat:@"%.2f Miles", num];
                
                strongSelf.distanceA.text = locationA;
                
                
                num  = ([responses[1] floatValue]/1609.34);
                NSString *locationB = [NSString stringWithFormat:@"%.2f Miles", num];
                
                strongSelf.distanceB.text = locationB;
                
                
                num  = ([responses[2] floatValue]/1609.34);
                NSString *locationC = [NSString stringWithFormat:@"%.2f Miles", num];
                
                strongSelf.distanceC.text = locationC;
                
                
                num  = ([responses[3] floatValue]/1609.34);
                NSString *locationD = [NSString stringWithFormat:@"%.2f Miles", num];
                
                strongSelf.distanceD.text = locationD;
                
                
                           }

            
        }
        
        
        
        else {
            
            strongSelf.distanceA.text = @"Error";
        }
        
        strongSelf.req = nil;
        strongSelf.calculateDistance.enabled = YES;

        
    };
    
    
    [self.req start];
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
