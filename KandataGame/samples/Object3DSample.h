//
//  Object3DSample.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__Object3DSample__
#define __KandataGame__Object3DSample__

#include "Game3DCamera.h"
#include "Game3DObject.h"
#include "CubeModel.h"

class Sample3DObj : public Game3DObject {
public:
    Sample3DObj(GameCore *pGame) : Game3DObject(pGame) {
        pModel = new CubeModel();
    }
    
    // Override
    virtual void Init(GameObjList *);
    virtual void Move(GameObjList *);
};

#endif /* defined(__KandataGame__Object3DSample__) */
