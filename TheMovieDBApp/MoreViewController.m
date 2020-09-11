//
//  MoreViewController.m
//  TheMovieDBApp
//
//  Created by Charles Sayre on 9/10/20.
//  Copyright © 2020 Charles Sayre. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeTime;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (strong,nonatomic) NSArray *pickerData;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (nonatomic) int labelInt;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentExample;
@property (weak, nonatomic) IBOutlet UILabel *segmentLabel;
@end

@implementation MoreViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.numberLabel.textColor = [UIColor colorWithRed:self.redSlider.value/255.0 green:self.greenSlider.value/255.0 blue:self.blueSlider.value/255.0 alpha:1];
    self.stepper.backgroundColor = [UIColor lightGrayColor];
    
    self.labelInt = 0;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimerLabel) userInfo:nil repeats:YES];
}

- (void) updateTimerLabel{
    self.labelInt ++;
    
    self.timerLabel.text = [NSString stringWithFormat:@"You have been on this view for %d seconds",self.labelInt];
    
}


- (IBAction)sliderUpdate:(id)sender {
    self.numberLabel.textColor = [UIColor colorWithRed:self.redSlider.value/255.0 green:self.greenSlider.value/255.0 blue:self.blueSlider.value/255.0 alpha:1];
}

- (IBAction)stepperChange:(UIStepper*) sender {
    
    double value = [sender value];
    
    self.numberLabel.text = [NSString stringWithFormat:@"%d", (int) value];
    
}


//Issues an invalid mode warning, the internet tells me just to ignore it so...
- (IBAction)switchFlicked:(UISwitch *)sender {
    
    UISwitch *S = sender;
    
    if([S isOn]){
        self.view.backgroundColor = [UIColor whiteColor];
        self.timeTime.textColor = [UIColor blackColor];
        self.timerLabel.textColor = [UIColor blackColor];
        self.segmentLabel.textColor = [UIColor blackColor];
        self.timeTime.text = @"Daytime";
        
    }
    
    else{
        self.view.backgroundColor = [UIColor blackColor];
        self.timeTime.textColor = [UIColor whiteColor];
        self.timerLabel.textColor = [UIColor whiteColor];
        self.segmentLabel.textColor = [UIColor whiteColor];
        self.timeTime.text = @"Nighttime";
    }
}


- (IBAction)segementChanged:(UISegmentedControl *)sender {
    
    switch(sender.selectedSegmentIndex){
    case 0:
        _segmentLabel.text = @"First Selected";
        break;
        
    case 1:
        _segmentLabel.text = @"Second Selected";
        break;
        
    default:
        _segmentLabel.text = @"None Selected";
        break;
            
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
