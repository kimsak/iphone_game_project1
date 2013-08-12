//
//  SceneSample.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__SceneSample__
#define __KandataGame__SceneSample__

#include "Scene.h"
#include "GameObject.h"
#include "Camera.h"

class SceneSample : public CScene {
    GameObject *pRoot;
    Camera camera;
public:
    /**
     *  コンストラクタ
     */
    SceneSample(GameCore *pGame) : CScene(pGame) {}
    
    // デストラクタ
    ~SceneSample() {
        if(pRoot) pRoot->DestroyChildAll(), delete pRoot;
    }
    
    virtual void LoadContents();
    virtual void Init();
    virtual void Update();
    virtual void Draw();
};

#endif /* defined(__KandataGame__SceneSample__) */
