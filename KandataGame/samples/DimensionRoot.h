//
//  DimensionRoot.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/16.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef KandataGame_DimensionRoot_h
#define KandataGame_DimensionRoot_h
#include "GameObject.h"
#include "_useGL.h"

class DimensionRoot : public GameObject {
public:
    // コンストラクタ
    DimensionRoot(GameCore *pGame) : GameObject(pGame) {}
    
    virtual void Draw() {
        // 深度値をクリアする
        glClear(GL_DEPTH_BUFFER_BIT);
    }
};

#endif
