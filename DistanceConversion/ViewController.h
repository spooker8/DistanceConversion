//
//  ViewController.h
//  DistanceConversion
//
//  Created by Anand Kumar on 21/09/2015.
//  Copyright © 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *startLocation;
@property (strong, nonatomic) IBOutlet UITextField *endLocationA;
@property (strong, nonatomic) IBOutlet UITextField *endLocationB;
@property (strong, nonatomic) IBOutlet UITextField *endLocationC;
@property (strong, nonatomic) IBOutlet UITextField *endLocationD;


@property (strong, nonatomic) IBOutlet UILabel *distanceA;
@property (strong, nonatomic) IBOutlet UILabel *distanceB;
@property (strong, nonatomic) IBOutlet UILabel *distanceC;
@property (strong, nonatomic) IBOutlet UILabel *distanceD;


@property (strong, nonatomic) IBOutlet UIButton *calculateDistance;

@property (strong, nonatomic) IBOutlet UISegmentedControl *controller;



@end

