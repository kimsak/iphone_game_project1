//
//  InputMotion_ObjCImpl.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/11.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "InputMotion.h"

#ifdef __APPLE__

/*static*/KMMotionManagerPtr InputMotion::pManager = NULL;

/**
 *  コンストラクタ
 */
InputMotion::InputMotion() {
    if (pManager == NULL) {
        pManager = [[CMMotionManager alloc] init];
    }
}

/**
 *  デストラクタ
 */
InputMotion::~InputMotion() {
    if(pManager) {
        pManager = nil;
    }
}

////////////////////////////////////// 加速度センサー ////////////////////////////////////

void InputMotion::SetAccelUpdateInterval(float val) {
    pManager.accelerometerUpdateInterval = (NSTimeInterval)val;
}

void InputMotion::StartAccelUpdate() {
    if(IsAccelAvailable()) [pManager startAccelerometerUpdates];
}

void InputMotion::StopAccelUpdate() {
    if(IsAccelAvailable() && IsAccelActive()) [pManager stopAccelerometerUpdates];
}

bool InputMotion::IsAccelActive() {
    return pManager.isAccelerometerAvailable==YES ? true : false;
}

bool InputMotion::IsAccelAvailable() {
    return pManager.isAccelerometerAvailable==YES ? true : false;
}

void InputMotion::AcquireAccelData(CVector *pData) {
    if(pData && pManager) {
        pData->X = (float)pManager.accelerometerData.acceleration.x;
        pData->Y = (float)pManager.accelerometerData.acceleration.y;
        pData->Z = (float)pManager.accelerometerData.acceleration.z;
    }
}

#endif  /*__APPLE__*/
