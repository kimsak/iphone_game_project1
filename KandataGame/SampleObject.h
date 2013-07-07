//
//  SampleObject.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/02.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__SampleObject__
#define __KandataGame__SampleObject__

#include "Game2DObject.h"

class SampleObject : public Game2DObject {
public:
    SampleObject(BaseGame &gameRef) : Game2DObject(gameRef) {}
    
    virtual void Init();
    virtual void Move(GameObjList *);
    virtual void Draw();
};

#endif /* defined(__KandataGame__SampleObject__) */
