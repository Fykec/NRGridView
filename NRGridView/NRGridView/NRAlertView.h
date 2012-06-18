//
//  NRAlertView.h
//  Core
//
//  Created by Jiaji Yin on 6/14/12.
//  Copyright (c) 2012 OK All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NRGridView.h"
#import "NRAlertViewButton.h"
#import "NRAlertViewDataSource.h"
#import "NRAlertViewDelegate.h"

@interface NRAlertView : UIView <NRGridViewDataSource, NRGridViewDelegate>
{
    NRGridView *_menuItemGridView;
    UIButton *_cancelButton;
}

@property (nonatomic, assign) id<NRAlertViewDelegate> delegate;
@property (nonatomic, assign) id<NRAlertViewDataSource> dataSource;
@property (nonatomic, readonly) UIButton *cancelButton;

- (void)setMenuItemCellSize:(CGSize)itemSize;

- (void)loadMenuItems;

@end
