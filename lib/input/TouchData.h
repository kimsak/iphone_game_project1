//
//  TouchData.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/02.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef TOUCH_DATA_H_
#define TOUCH_DATA_H_

// xy座標を表す構造体
struct KMPoint2D {
    float x;
    float y;
};

class TouchData {
public:
    virtual KMPoint2D *GetCurrPos() = 0;
    virtual KMPoint2D *GetPrevPos() = 0;
    
    virtual int GetPhase() = 0;
};

#endif /*defined(TOUCH_DATA_H_)*/
