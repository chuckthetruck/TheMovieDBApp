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
@property (weak, nonatomic) IBOutlet UIButton *buttonExample;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong,nonatomic) NSArray *pickerData;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.numberLabel.textColor = [UIColor colorWithRed:self.redSlider.value/255.0 green:self.greenSlider.value/255.0 blue:self.blueSlider.value/255.0 alpha:1];
    self.stepper.backgroundColor = [UIColor lightGrayColor];
    _pickerData = @[@"See the Button Text Change",@"Wow again?",@"Third Times The Charm",@"Pressing This will go to the Timer view too"];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
}

- (IBAction)sliderUpdate:(id)sender {
    self.numberLabel.textColor = [UIColor colorWithRed:self.redSlider.value/255.0 green:self.greenSlider.value/255.0 blue:self.blueSlider.value/255.0 alpha:1];
}

- (IBAction)stepperChange:(UIStepper*) sender {
    
    double value = [sender value];
    
    self.numberLabel.text = [NSString stringWithFormat:@"%d", (int) value];
    
}

- (IBAction)segmentTapped:(UISegmentedControl *)sender {
    
    NSInteger sIndex = [sender selectedSegmentIndex];
    
    switch (sIndex){
        case 0:
            self.buttonExample.tintColor = [UIColor orangeColor];
            break;
            
        case 1:
            self.buttonExample.tintColor = [UIColor purpleColor];
            break;
        
        default:
            self.buttonExample.tintColor = [UIColor blueColor];
            break;
    }
}

//Issues an invalid mode warning, the internet tells me just to ignore it so...
- (IBAction)switchFlicked:(UISwitch *)sender {
    
    UISwitch *S = sender;
    
    if([S isOn]){
        self.view.backgroundColor = [UIColor whiteColor];
        self.timeTime.textColor = [UIColor blackColor];
        self.timeTime.text = @"Daytime";
    }
    
    else{
        self.view.backgroundColor = [UIColor blackColor];
        self.timeTime.textColor = [UIColor whiteColor];
        self.timeTime.text = @"Nighttime";
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _pickerData.count;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    [self.buttonExample setTitle:_pickerData[row] forState:UIControlStateNormal];
    
    return _pickerData[row];
    
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
