//
//  FCCalculatorViewController.h
//  FirstCalculator
//
//  Created by Jaesung Moon on 2014. 2. 3..
//  Copyright (c) 2014년 Jaesung Moon. All rights reserved.
//

#import <UIKit/UIKit.h>

//계산하는 타입
enum CalculatorType{
    kCalculatorTypePlus = 2001
    ,kCalculatorTypeMinus = 2002//제일 위에만 정의하면 다음에는 1씩 자동으로 늘어납니다.
    ,kCalculatorTypeMultiply
    ,kCalculatorTypeDivide
};
/**
 * \brief 계산기 화면을 관리하는 뷰컨트롤러
 */
@interface FCCalculatorViewController : UIViewController{
    float storedNumber;
    float targetNumber;
    int calculatorMode;
}
/**
 * \brief 계산기에 표시되는 번호용 라벨
 */
@property (strong, nonatomic) IBOutlet UILabel *labelNumber;
/**
 *\brief 상태표시를 위해 사용하는 라벨
 */
@property (strong, nonatomic) IBOutlet UILabel *stateLabel;

- (IBAction)numberButtonClicked:(id)sender;
- (IBAction)dotButtonClicked:(id)sender;
- (IBAction)changeDigitButtonClicked:(id)sender;
- (IBAction)resetButtonClicked:(id)sender;
- (IBAction)calButtonClicked:(id)sender;
- (IBAction)equalButtonClicked:(id)sender;
- (IBAction)closeButtonClicked:(id)sender;

@end
