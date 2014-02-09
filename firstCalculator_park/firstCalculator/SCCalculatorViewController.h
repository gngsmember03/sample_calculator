//
//  SCCalculatorViewController.h
//  firstCalculator
//
//  Created by boseung on 14. 2. 8..
//  Copyright (c) 2014년 boseung. All rights reserved.
//

#import <UIKit/UIKit.h>

enum calType {
    kPlus = 201,
    kMinus,
    kMulitpy,
    kDivide,
    };

@interface SCCalculatorViewController : UIViewController{
    float beforeNumber ;
    float afterNumber ;
    int calMode ;
}
@property (strong, nonatomic) IBOutlet UILabel *labelDisplay;

- (IBAction)equalButton:(id)sender;
- (IBAction)numberButton:(id)sender;
- (IBAction)calButton:(id)sender;
- (IBAction)chabgeButton:(id)sender;
- (IBAction)resetButton:(id)sender;
- (IBAction)closeButton:(id)sender;
- (IBAction)dotButton:(id)sender;
@end
