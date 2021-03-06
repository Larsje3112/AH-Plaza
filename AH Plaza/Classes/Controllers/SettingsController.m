//
//  InstructionsManager.m
//  AH Plaza
//
//  Created by Casper Eekhof on 08-08-13.
//  Copyright (c) 2013 JTC. All rights reserved.
//

#import "SettingsController.h"

@implementation SettingsController

NSString *documentsDirectory;
NSString *fileLocation;

- (id)init
{
    self = [super init];
    if (self) {
        documentsDirectory = [NSHomeDirectory()
                              stringByAppendingPathComponent:@"Documents"];
        fileLocation =  [[NSString alloc] initWithFormat: @"%@/%@", documentsDirectory , @"settings.ahpu"];
        
        // Load settings if available.
        if([[NSFileManager defaultManager] fileExistsAtPath: fileLocation])
            self = [NSKeyedUnarchiver unarchiveObjectWithFile: fileLocation];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[[NSNumber alloc] initWithBool: self.planningInstructionsDisplayed] forKey:@"planningInstructionsDisplayed"];
    [encoder encodeObject:[[NSNumber alloc] initWithBool: self.autologinEnabled] forKey:@"autologinEnabled"];
    [encoder encodeObject:[[NSNumber alloc] initWithBool: self.notificationPaymentEnabled] forKey:@"notificationPaymentEnabled"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.planningInstructionsDisplayed = [[coder decodeObjectForKey: @"planningInstructionsDisplayed"] boolValue];
        self.autologinEnabled = [[coder decodeObjectForKey: @"autologinEnabled"] boolValue];
        self.notificationPaymentEnabled = [[coder decodeObjectForKey: @"notificationPaymentEnabled"] boolValue];
    }
    return self;
}

+ (id)sharedInstance {
    static SettingsController *instance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{ instance = [[SettingsController alloc] init]; });
    
    return instance;
}

// Save the settings to the disk
- (void) saveSettings {
    [NSKeyedArchiver archiveRootObject:self toFile: fileLocation];
}


- (void) reset {
    _autologinEnabled = NO;
    _notificationPaymentEnabled = NO;
    [self saveSettings];
}

// Intercept all setters and inject the save settings method
-(void)setPlanningInstructionsDisplayed:(BOOL)planningInstructionsDisplayed {
    self->_planningInstructionsDisplayed = planningInstructionsDisplayed;
    [self saveSettings];
}


-(void)setAutologinEnabled:(BOOL)autologinEnabled {
    self->_autologinEnabled = autologinEnabled;
    [self saveSettings];
}

-(void)setNotificationPaymentEnabled:(BOOL)notificationPaymentEnabled {
    self->_notificationPaymentEnabled = notificationPaymentEnabled;
    [self saveSettings];
}

@end
