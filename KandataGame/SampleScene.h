//
//  SampleScene.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/29.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__SampleScene__
#define __KandataGame__SampleScene__

#include "Scene.h"
#include "GameObjList.h"

class SampleScene : public CScene {
    GameObjList gameObjs;
public:
    SampleScene(BaseGame &gameRef) : CScene(gameRef) {}
    
    virtual void LoadContents();
    virtual void Init();
    virtual void Update();
    virtual void Draw();
};

#endif /* defined(__KandataGame__SampleScene__) */
