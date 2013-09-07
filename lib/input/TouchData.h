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
typedef UITouch *TouchPointer;
#else
typedef void *TouchPointer;
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
    const TouchPointer pTouch;
public:
    // コンストラクタ
    TouchData(TouchPointer t) : pTouch(t) {}
    
    KMPoint2D GetCurrPos();
    KMPoint2D GetPrevPos();
    
    KMTouchPhase GetPhase();
    
    int GetTapCount();
};

#endif /*defined(TOUCH_DATA_H_)*/
