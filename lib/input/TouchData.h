//
//  TouchData.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/02.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef TOUCH_DATA_H_
#define TOUCH_DATA_H_

// OS Determination macro
#ifdef __APPLE__
#include <UIKit/UIKit.h>
typedef __weak UITouch *TouchPointer;
typedef __weak const UITouch *ConstTouchPtr;
#define TOUCHPTR_NULL  (nil)
#else
typedef void *TouchPointer;
typedef const void *ConstTouchPtr;
#define TOUCHPTR_NULL  (NULL)
#endif

enum KMTouchPhase {
    KMTouchBegan,
    KMTouchMoved,
    KMTouchStationary,
    KMTouchEnded,
    KMTouchCancelled,
};

// xy座標を表す構造体
struct KMPoint2D {
    float x;
    float y;
};

class TouchData {
    TouchPointer pTouch;
public:
    // コンストラクタ
    TouchData(TouchPointer t) : pTouch(t) {}
    
    KMPoint2D GetCurrPos() const;
    KMPoint2D GetPrevPos() const;
    
    KMTouchPhase GetPhase() const;
    
    int GetTapCount() const;
    
    ConstTouchPtr GetTouchPtr() const {
        return pTouch;
    }
};

#endif /*defined(TOUCH_DATA_H_)*/
