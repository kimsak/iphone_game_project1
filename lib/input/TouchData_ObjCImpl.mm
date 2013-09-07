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
    CGPoint cp = [pTouch locationInView:nil];
    KMPoint2D p = {cp.x, cp.y};
    return p;
}

KMPoint2D TouchData::GetPrevPos() const {
    CGPoint cp = [pTouch previousLocationInView:nil];
    KMPoint2D p = {cp.x, cp.y};
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

