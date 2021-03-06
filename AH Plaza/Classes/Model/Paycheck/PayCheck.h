//
//  PayCheck.h
//  AH Plaza
//
//  Created by Casper Eekhof on 12-10-13.
//  Copyright (c) 2013 JTC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Paycheck : NSObject

typedef enum {
    PAYCHECK_TYPE,
    YEARSUMARRY_TYPE
} PaycheckType;

@property NSString * year;
@property NSInteger month;
@property NSDate * date;
@property PaycheckType type;
@property NSURL * urlToPDF;

@end
