//
//  ObjectSample.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__ObjectSample__
#define __KandataGame__ObjectSample__

#include "Game2DObject.h"

class ObjectSample : public Game2DObject {
public:
    virtual void Init();
    virtual void Move(GameObjList *);
    virtual void Draw();
};

#endif /* defined(__KandataGame__ObjectSample__) */
