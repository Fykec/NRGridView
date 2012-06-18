//
//  NRAlertView.m
//  Core
//
//  Created by Jiaji Yin on 6/14/12.
//  Copyright (c) 2012 OK. All rights reserved.
//

#import "NRAlertView.h"

@implementation NRAlertView
@synthesize delegate;
@synthesize dataSource;
@synthesize cancelButton = _cancelButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _menuItemGridView = [[NRGridView alloc] initWithLayoutStyle:NRGridViewLayoutStyleVertical];
        _menuItemGridView.backgroundColor = [UIColor clearColor];
        _menuItemGridView.delegate = self;
        _menuItemGridView.dataSource = self;
        [self addSubview:_menuItemGridView];
        _cancelButton = [[UIButton alloc] init];
        [_cancelButton addTarget:self action:@selector(onCancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelButton];
    }
    return self;
}

- (void)setMenuItemCellSize:(CGSize)itemSize
{
    [_menuItemGridView setCellSize:itemSize];
}

- (void)loadMenuItems
{
    [_menuItemGridView reloadData];
}

- (void)layoutSubviews
{
    CGRect bounds = self.bounds;
    
    CGSize menuSize = CGSizeZero;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(sizeOfMenuInNRAlertView:)])
    {
        menuSize = [self.dataSource sizeOfMenuInNRAlertView:self];
    }
    CGFloat menuTopMargin = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(topMarginOfMenuInNRAlertView:)])
    {
        menuTopMargin = [[self dataSource] topMarginOfMenuInNRAlertView:self];
    }
    _menuItemGridView.frame = CGRectMake(ceilf((bounds.size.width - menuSize.width) / 2), menuTopMargin, menuSize.width, menuSize.height);
    
    CGRect leftBounds = CGRectMake(0, 0, bounds.size.width, bounds.size.height - (menuTopMargin + menuSize.height));
    CGSize cancelSize  = CGSizeZero;
    CGFloat cancelTopMargin = 0;
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(sizeOfCancelButtonInNRAlertView:)])
    {
        cancelSize = [self.dataSource sizeOfCancelButtonInNRAlertView:self];
    }
    
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(topMarginOfCancelButtonInNRAlertView:)])
    {
        cancelTopMargin = [self.dataSource topMarginOfCancelButtonInNRAlertView:self];
    }
    
    _cancelButton.frame = CGRectMake(ceilf((leftBounds.size.width - cancelSize.width) / 2), menuTopMargin + menuSize.height + cancelTopMargin, cancelSize.width, cancelSize.height);
}

#pragma -mark NRAlertViewDataSource
- (NSInteger)NRGridView:(NRGridView*)gridView numberOfItemsInSection:(NSInteger)section
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfMenuItemsInNRAlertView:)])
    {
        return [self.dataSource numberOfMenuItemsInNRAlertView:self];
    }
    else 
    {
        return 0;
    }
}

- (NRGridViewCell*)NRGridView:(NRGridView*)gridView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(NRAlertView:cellForItemAtIndex:)])
    {
        return [self.dataSource NRAlertView:self cellForItemAtIndex:indexPath.row];
    }
    else 
    {
        return nil;
    }
}

#pragma -mark NRAlertViewDelegate

- (void)NRGridView:(NRGridView *)gridView willDisplayCell:(NRGridViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NRAlertViewButton *alertButton = (NRAlertViewButton *)cell;
    alertButton.button.tag = [indexPath row];
    [alertButton.button addTarget:self action:@selector(onButtonTouchUp:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onButtonTouchUp:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(NRAlertView:didSelectMenuItemAtIndex:)])
    {
        [self.delegate NRAlertView:self didSelectMenuItemAtIndex:sender.tag];
    }
}

- (void)onCancelButtonClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectCancelButtonInNRAlertView:)])
    {
        [self.delegate didSelectCancelButtonInNRAlertView:self];
    }
}

- (void)dealloc
{
    [_menuItemGridView release];
    [_cancelButton release];
    [super dealloc];
}

@end
