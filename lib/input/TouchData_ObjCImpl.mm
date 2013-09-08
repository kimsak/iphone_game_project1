//
//  TouchData_ObjCImpl.MM
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "TouchData.h"

#ifdef __APPLE__

KMPoint2D TouchData::GetCurrPos() const {
    // Retina対応
    float scale = [UIScreen mainScreen].scale;
    
    CGPoint cp = [pTouch locationInView:nil];
    KMPoint2D p = {cp.x * scale, cp.y * scale};
    return p;
}

KMPoint2D TouchData::GetPrevPos() const {
    // Retina対応
    float scale = [UIScreen mainScreen].scale;
    
    CGPoint cp = [pTouch previousLocationInView:nil];
    KMPoint2D p = {cp.x * scale, cp.y * scale};
    return p;
}

KMTouchPhase TouchData::GetPhase() const {
    switch(pTouch.phase) {
        case UITouchPhaseBegan:
            return KMTouchBegan;
        case UITouchPhaseMoved:
            return KMTouchMoved;
        case UITouchPhaseStationary:
            return KMTouchStationary;
        case UITouchPhaseEnded:
            return KMTouchEnded;
        case UITouchPhaseCancelled:
            return KMTouchCancelled;
    }
}

int TouchData::GetTapCount() const {
    return pTouch.tapCount;
}

#endif  // __APPLE__

