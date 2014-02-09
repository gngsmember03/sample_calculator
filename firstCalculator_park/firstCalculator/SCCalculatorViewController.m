//
//  SCCalculatorViewController.m
//  firstCalculator
//
//  Created by boseung on 14. 2. 8..
//  Copyright (c) 2014년 boseung. All rights reserved.
//

#import "SCCalculatorViewController.h"

@interface SCCalculatorViewController ()

@end

@implementation SCCalculatorViewController

//닙파일을 사용할때 쓰이는 메소드
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

//메모리가 부족할때 쓰이는 메소드
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//이퀄버튼 계싼의 결과를 나타내주는 로직
- (IBAction)equalButton:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    
    NSString *afterText = _labelDisplay.text;
    afterNumber = [afterText floatValue];
    NSLog(@"beforeNumber = %f",beforeNumber);
    NSLog(@"afterNumber = %f",afterNumber);
    NSLog(@"calMode = %d",calMode);
    
    float res ;
    switch (calMode) {
        case kPlus:
            res = beforeNumber + afterNumber;
            break;
            
        case kMinus:
            res = beforeNumber - afterNumber;
            break;
            
        case kMulitpy:
            res = beforeNumber * afterNumber;
            break;
            
        case kDivide:
            res = beforeNumber / afterNumber;
            break;
    }
    NSLog(@"RES = %f",res);
    
    [_labelDisplay setText:[NSString stringWithFormat:@"%f",res]];

}

//숫자버튼
- (IBAction)numberButton:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    NSInteger inputNum = [sender tag];
    NSLog(@"inputNum = %i",inputNum);
    
    //Todo:왜 100을 빼?
    beforeNumber = inputNum - 100;
    NSLog(@"beforeNumber = %f", beforeNumber);
    
    if ([_labelDisplay.text isEqualToString:@"0"]) {//레이블의 숫자가 0일경우
        [_labelDisplay setText:[NSString stringWithFormat:@"%d",inputNum-100]];
    }else{//0이외의 다른숫자일떄
        NSString *text = _labelDisplay.text;
        //레이블에 숫자를 찍어줌.
        [_labelDisplay setText:[NSString stringWithFormat:@"%@%d",text,inputNum-100]];
    }
    
    
}

//연산로직
- (IBAction)calButton:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    
    NSInteger inputNum = [sender tag];
    calMode = inputNum;
    
    NSString *beforeText = _labelDisplay.text;
    beforeNumber = [beforeText floatValue];
    
    NSLog(@"beforeNumber = %f",beforeNumber);
    [_labelDisplay setText:@"0" ];
}

//기능변경 로직
- (IBAction)chabgeButton:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    if([_labelDisplay.text isEqualToString:@"0"]){
        //처리없음
    }else{
        [_labelDisplay setText:[NSString stringWithFormat:@"-%@",_labelDisplay.text]];
    }

}


- (IBAction)resetButton:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    calMode = 0;
    [_labelDisplay setText:@"0"];

}

- (IBAction)closeButton:(id)sender {
    NSLog(@"%s",__FUNCTION__);

}

- (IBAction)dotButton:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    
    if([_labelDisplay.text isEqualToString:@"0"]){
        //처리없음
    }else{
        [_labelDisplay setText:[NSString stringWithFormat:@"%@",_labelDisplay.text]];
    }
    

}
@end
