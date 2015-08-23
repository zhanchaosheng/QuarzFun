//
//  QuartzFunView.h
//  QuartzFun
//
//  Created by Cusen on 15/8/20.
//  Copyright © 2015年 cusen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface QuartzFunView : UIView

@property (assign, nonatomic) CGPoint firstToushLocation;
@property (assign, nonatomic) CGPoint lastToushLocation;
@property (assign, nonatomic) ShapeType shapeType;
@property (assign, nonatomic) BOOL useRandomColor;
@property (strong, nonatomic) UIColor *currentColor;
@property (strong, nonatomic) UIImage *drawImage;
@property (readonly, nonatomic) CGRect currentRect;
@property (assign, nonatomic) CGRect redrawRect;

@end
