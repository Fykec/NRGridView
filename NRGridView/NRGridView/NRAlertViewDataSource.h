//
//  NRAlertViewDataSource.h
//  Core
//
//  Created by Jiaji Yin on 6/14/12.
//  Copyright (c) 2012 OK. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NRAlertView;
@class NRAlertViewButton;

@protocol NRAlertViewDataSource <NSObject>

- (NSInteger)numberOfMenuItemsInNRAlertView:(NRAlertView*)alertView;

- (NRAlertViewButton*)NRAlertView:(NRAlertView*)alertView cellForItemAtIndex:(NSInteger)index;

- (CGFloat)topMarginOfMenuInNRAlertView:(NRAlertView*)alertView;

- (CGSize)sizeOfMenuInNRAlertView:(NRAlertView*)alertView;

- (CGFloat)topMarginOfCancelButtonInNRAlertView:(NRAlertView*)alertView;

- (CGSize)sizeOfCancelButtonInNRAlertView:(NRAlertView*)alertView;

@end
