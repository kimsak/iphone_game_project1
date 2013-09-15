//
//  TouchData_ObjCImpl.MM
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "TouchData.h"

#ifdef __APPLE__

static void AdjustPositionByOrientation(KMPoint2D *pPos, UIInterfaceOrientation orient) {
    float tmpX = pPos->x, tmpY = pPos->y;
    // デバイスの幅高さを取得
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    switch (orient) {
        case UIInterfaceOrientationPortraitUpsideDown:
            pPos->x = screenRect.size.width - tmpX;
            pPos->y = screenRect.size.height - tmpY;
            break;
        case UIInterfaceOrientationLandscapeRight:
            pPos->x = tmpY;
            pPos->y = screenRect.size.width - tmpX;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            pPos->x = screenRect.size.height - tmpY;
            pPos->y = tmpX;
            break;
        default:
            break;
    }
}

KMPoint2D TouchData::GetCurrPos() const {
    // Retina対応
    float scale = [UIScreen mainScreen].scale;
    // 画面の向きを取得する
    UIInterfaceOrientation orient = [UIApplication sharedApplication].statusBarOrientation;
    
    CGPoint cp = [pTouch locationInView:nil];
    KMPoint2D p = {cp.x * scale, cp.y * scale};
    AdjustPositionByOrientation(&p, orient);
    return p;
}

KMPoint2D TouchData::GetPrevPos() const {
    // Retina対応
    float scale = [UIScreen mainScreen].scale;
    // 画面の向きを取得する
    UIInterfaceOrientation orient = [UIApplication sharedApplication].statusBarOrientation;
    
    CGPoint cp = [pTouch previousLocationInView:nil];
    KMPoint2D p = {cp.x * scale, cp.y * scale};
    AdjustPositionByOrientation(&p, orient);
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

