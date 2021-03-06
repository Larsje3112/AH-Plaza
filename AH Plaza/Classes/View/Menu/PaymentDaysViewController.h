//
//  PaymentDaysViewController.h
//  AH Plaza
//
//  Created by Casper Eekhof on 02-08-13.
//  Copyright (c) 2013 JTC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHViewController.h"

@interface PaymentDaysViewController : AHViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *upcommingPaymentView;
@property (weak, nonatomic) IBOutlet UILabel *nextPaymentLabel;
@property (weak, nonatomic) IBOutlet UITableView *upcommingPaymentsDaysTable;
@property (weak, nonatomic) IBOutlet UILabel *nextDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *daysOrDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *nextPayDaysStaticLabel;

@end
