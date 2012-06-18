//
//  NRAlertViewButton.m
//  Core
//
//  Created by Jiaji Yin on 6/14/12.
//  Copyright (c) 2012 OK. All rights reserved.
//

#import "NRAlertViewButton.h"

@implementation NRAlertViewButton
@synthesize button = _innerButton;
@synthesize padding = _innerPadding;

- (id)init
{
    self = [super initWithReuseIdentifier:@"NRAlertViewButton"];
    if (self)
    {
        _innerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_innerButton];
    }
    return self;
}


-(void)layoutSubviews
{
    CGRect bounds = self.bounds;
    _innerButton.frame = CGRectMake(_innerPadding.x, _innerPadding.y, bounds.size.width - _innerPadding.x * 2, bounds.size.height - _innerPadding.y * 2);
}

@end
