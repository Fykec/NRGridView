//
//  NRAlertViewDelegate.h
//  Core
//
//  Created by Jiaji Yin on 6/14/12.
//  Copyright (c) 2012 OK. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NRAlertView;
@class NRAlertViewButton;

@protocol NRAlertViewDelegate <NSObject>

- (void)NRAlertView:(NRAlertView*)alertView didSelectMenuItemAtIndex:(NSInteger)index;

- (void)didSelectCancelButtonInNRAlertView:(NRAlertView*)alertView ;

@end
