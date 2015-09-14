//
//  SelectArrivalViewController.m
//  GrandHotel
//
//  Created by Matthew McClure on 9/11/15.
//  Copyright (c) 2015 Matthew McClure. All rights reserved.
//

#import "SelectArrivalViewController.h"
#import "SelectDepartureViewController.h"

@interface SelectArrivalViewController ()

@property (strong,nonatomic) UILabel *selectLabel;
@property (strong,nonatomic) UILabel *selectLabel2;
@property (strong,nonatomic) UIDatePicker *datePicker;
@property (strong,nonatomic) UIDatePicker *datePicker2;
//@property (strong,nonatomic) NSDate *dateSelected;
@property (strong,nonatomic) UIButton *nextButton;

@end

@implementation SelectArrivalViewController

- (void)loadView {
  UIView *rootView = [[UIView alloc] init];
  
  rootView.backgroundColor = [UIColor whiteColor];
  
 // double frameHeight = self.view.frame.size.height;
  
  //create label
  UILabel *selectLabel = [[UILabel alloc]initWithFrame:rootView.frame];
  self.selectLabel = selectLabel;
  [selectLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:selectLabel];
  
  UILabel *selectLabel2 = [[UILabel alloc]initWithFrame:rootView.frame];
  self.selectLabel2 = selectLabel2;
  [selectLabel2 setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:selectLabel2];
  
  //create date picker
  UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:rootView.frame];
  self.datePicker = datePicker;
  [datePicker setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:datePicker];
  
  UIDatePicker *datePicker2 = [[UIDatePicker alloc] initWithFrame:rootView.frame];
  self.datePicker2 = datePicker2;
  [datePicker2 setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:datePicker2];
  
  //create button
  UIButton *nextButton = [[UIButton alloc] initWithFrame:rootView.frame];
  self.nextButton = nextButton;
  [nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [nextButton setTitle:@"Next" forState:UIControlStateNormal];
  [nextButton setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:nextButton];
  
  //declare views for constraints
  NSDictionary *views = @{@"selectLabel" : selectLabel, @"datePicker" : datePicker, @"selectLabel2" : selectLabel2, @"datePicker2" : datePicker2, @"nextButton" : nextButton};
  
  //set label contraints
  NSArray *selectLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[selectLabel(80)]" options:0 metrics:nil views:views];
  [rootView addConstraints:selectLabelVerticalConstraints];
  NSArray *selectLabelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[selectLabel]|" options:0 metrics:nil views:views];
  [rootView addConstraints:selectLabelHorizontalConstraints];
  
  //set date picker constraints
   NSArray *datePickerVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[selectLabel]-[datePicker(80)]" options:0 metrics:nil views:views];
   [rootView addConstraints:datePickerVerticalConstraints];
   NSArray *datePickerHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[datePicker]|" options:0 metrics:nil views:views];
   [rootView addConstraints:datePickerHorizontalConstraints];
  
  //set label2 contraints
  NSArray *selectLabel2VerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[datePicker]-[selectLabel2(80)]" options:0 metrics:nil views:views];
  [rootView addConstraints:selectLabel2VerticalConstraints];
  NSArray *selectLabel2HorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[selectLabel2]|" options:0 metrics:nil views:views];
  [rootView addConstraints:selectLabel2HorizontalConstraints];
  
  
  //set datepicker2 constraints
  NSArray *datePicker2VerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[selectLabel2]-[datePicker2]" options:0 metrics:nil views:views];
  [rootView addConstraints:datePicker2VerticalConstraints];
  NSArray *datePicker2HorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[datePicker2]|" options:0 metrics:nil views:views];
  [rootView addConstraints:datePicker2HorizontalConstraints];
  
   //set button constraints
  NSArray *nextButtonVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[nextButton]-|" options:0 metrics:nil views:views];
  [rootView addConstraints:nextButtonVerticalConstraints];
  NSArray *nextButtonHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[nextButton]|" options:0 metrics:nil views:views];
  [rootView addConstraints:nextButtonHorizontalConstraints];
  
  _datePicker.datePickerMode = UIDatePickerModeDate;
  _datePicker2.datePickerMode = UIDatePickerModeDate;
  
  self.view = rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.selectLabel.text = @"Select Arrival Date";
  self.selectLabel.backgroundColor = [UIColor redColor];
  
  self.selectLabel2.text = @"Select Departure Date";
  self.selectLabel2.backgroundColor = [UIColor redColor];
  
  self.nextButton.backgroundColor = [UIColor blueColor];
}

-(void)nextButtonPressed:(UIButton *)sender {
  NSLog(@"b was pressed");
  
  //get date from picker
  self.arrivalDate = [self.datePicker date];
  self.departureDate = [self.datePicker2 date];
  NSLog(@"%@", self.arrivalDate);
  NSLog(@"%@", self.departureDate);
  SelectDepartureViewController *selectDepartureVC = [[SelectDepartureViewController alloc] init];
  [self.navigationController pushViewController:selectDepartureVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
