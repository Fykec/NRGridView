//
//  NRAlertViewButton.h
//  Core
//
//  Created by Jiaji Yin on 6/14/12.
//  Copyright (c) 2012 OK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NRGridViewCell.h"

@interface NRAlertViewButton : NRGridViewCell
{
    UIButton *_innerButton;
    CGPoint _innerPadding;//inner button padding
}

@property (nonatomic, readonly) UIButton *button;
@property (nonatomic, assign) CGPoint padding;

- (id)init;

@end
