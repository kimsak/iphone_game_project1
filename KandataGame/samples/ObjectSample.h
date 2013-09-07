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
#include "ITouchListener.h"

class ObjectSample : public Game2DObject, public ITouchListener {
public:
    // コンストラクタ
    ObjectSample(GameCore *pGame) : Game2DObject(pGame) {}
    // デストラクタ
    ~ObjectSample();
    
    virtual void Init();
    virtual void Move();
    virtual void Draw();
    
    virtual void OnTouchAction(const TouchData &touch);
};

#endif /* defined(__KandataGame__ObjectSample__) */
