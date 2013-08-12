//
//  Camera3DSample.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/12.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__Camera3DSample__
#define __KandataGame__Camera3DSample__
#include "Game3DObject.h"

class SampleCamera {
public:
    // コンストラクタ
    
    virtual bool Init();
    virtual bool Move();
    virtual bool Draw();
};

#endif /* defined(__KandataGame__Camera3DSample__) */
