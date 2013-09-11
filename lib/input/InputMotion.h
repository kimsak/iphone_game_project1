//
//  InputMotion.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/11.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef INPUT_MOTION_H_
#define INPUT_MOTION_H_
#include "Math.h"

// OS Determination Macro Statement
#ifdef  __APPLE__
#include <CoreMotion/CoreMotion.h>
typedef CMMotionManager *KMMotionManagerPtr;
#else
typedef void *KMMotionManagerPtr;
#endif

/**
 *  モーションデータを管理するクラス
 */
class InputMotion {
    static KMMotionManagerPtr pManager;
public:
    // コンストラクタ
    InputMotion();
    // デストラクタ
    ~InputMotion();
    
    ////////////////////////////// 加速度センサー ////////////////////////////////
    
    void SetAccelUpdateInterval(float val);
    
    void StartAccelUpdate();
    void StopAccelUpdate();
    
    bool IsAccelActive();
    bool IsAccelAvailable();
    
    void AcquireAccelData(CVector *pData);
};

#endif  /*INPUT_MOTION_H_*/
