//
//  Constants.h
//  QuartzFun
//
//  Created by Cusen on 15/8/20.
//  Copyright © 2015年 cusen. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

typedef NS_ENUM(NSInteger,ShapeType) {
    KLineShape = 0,
    KRectShape,
    KEllipseShape,
    KImageShape
};

typedef NS_ENUM(NSUInteger, ColorTabIndex) {
    KRedColorTab = 0,
    KBlueColorTab,
    KYellowColorTab,
    KGreenColorTab,
    KRandomColorTab
};

#define degreesToRadian(x) (M_PI * (x) / 180.0)

#endif /* Constants_h */
