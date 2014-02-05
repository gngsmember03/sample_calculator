//
//  FCCalculatorViewController.m
//  FirstCalculator
//
//  Created by Jaesung Moon on 2014. 2. 3..
//  Copyright (c) 2014년 Jaesung Moon. All rights reserved.
//

#import "FCCalculatorViewController.h"

@interface FCCalculatorViewController ()

@end

@implementation FCCalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (IBAction)numberButtonClicked:(id)sender {
    NSInteger buttonNumber = [sender tag];
    NSLog(@"number = %d",buttonNumber-1000);
    int inputNumber = buttonNumber-1000;
    
    if ([_labelNumber.text isEqualToString:@"0"]) {
        _labelNumber.text = [NSString stringWithFormat:@"%d",inputNumber];
    }else{
        NSString *labelText = [_labelNumber text];
        labelText = [labelText stringByAppendingString:[NSString stringWithFormat:@"%d",inputNumber]];
        [_labelNumber setText:labelText];
    }
}

- (IBAction)dotButtonClicked:(id)sender {
    if ([_labelNumber.text isEqualToString:@"0"]) {
        _labelNumber.text = @"0.";
    }else{
        NSString *labelText = [_labelNumber text];
        labelText = [labelText stringByAppendingString:@"."];
        [_labelNumber setText:labelText];
    }
}

- (IBAction)changeDigitButtonClicked:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    storedNumber = [_labelNumber.text floatValue];
    if (storedNumber != 0) {
        storedNumber = -storedNumber;
        [_labelNumber setText:[NSString stringWithFormat:@"%f",storedNumber]];
    }
}

- (IBAction)resetButtonClicked:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    [_stateLabel setText:@"Normal"];
    storedNumber = 0;
    [_labelNumber setText:@"0"];
    
}

- (IBAction)calButtonClicked:(id)sender {
    NSInteger buttonType = [sender tag];
    NSLog(@"%s type = %d",__FUNCTION__,buttonType);
    targetNumber = [_labelNumber.text floatValue];
    [_labelNumber setText:@"0"];
    calculatorMode = buttonType;
    switch (calculatorMode) {
        case kCalculatorTypePlus:
            [_stateLabel setText:@"+"];
            break;
        case kCalculatorTypeMinus:
            [_stateLabel setText:@"-"];
            break;
        case kCalculatorTypeMultiply:
            [_stateLabel setText:@"x"];
            break;
        case kCalculatorTypeDivide:
            [_stateLabel setText:@"/"];
            break;
    }//end switch

}

- (IBAction)equalButtonClicked:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    storedNumber = [_labelNumber.text floatValue];
    float sum;
    switch (calculatorMode) {
        case kCalculatorTypePlus:
            sum = targetNumber + storedNumber;
            break;
        case kCalculatorTypeMinus:
            sum = targetNumber - storedNumber;
            break;
        case kCalculatorTypeMultiply:
            sum = targetNumber * storedNumber;
            break;
        case kCalculatorTypeDivide:
            sum = targetNumber / storedNumber;
            break;
    }//end switch
    [_labelNumber setText:[NSString stringWithFormat:@"%f",sum]];
    [_stateLabel setText:@"Normal"];
    storedNumber = sum;
}

- (IBAction)closeButtonClicked:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
