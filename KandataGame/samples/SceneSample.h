//
//  SceneSample.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__SceneSample__
#define __KandataGame__SceneSample__

#include "../../lib/Scene.h"
#include "../../lib/GameObjList.h"
#include "../../lib/Game3DCamera.h"

class SceneSample : public CScene {
    GameObjList objList;
    GameObjList obj3DList;
public:
    /**
     *  コンストラクタ
     */
    SceneSample(GameCore *pGame) : CScene(pGame) {}
    
    virtual void LoadContents();
    virtual void Init();
    virtual void Update();
    virtual void Draw();
};

#endif /* defined(__KandataGame__SceneSample__) */
