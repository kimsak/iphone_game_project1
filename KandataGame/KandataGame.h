//
//  KandataGame.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/16.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__KandataGame__
#define __KandataGame__KandataGame__

#include "BaseGame.h"
#include "_useGL.h"
#include "Scene.h"

class KandataGame : public BaseGame {
    CScene *pScene;
    
public:
    // コンストラクタ
    KandataGame(int w, int h) : BaseGame(w, h), pScene(NULL) {}
    
    virtual void Initialize();
    virtual void Update();
    virtual void Draw();
//    void Finalize();
};

#endif /* defined(__KandataGame__KandataGame__) */
