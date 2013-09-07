//
//  KandataGame.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/16.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__KandataGame__
#define __KandataGame__KandataGame__

#include "GameCore.h"
#include "_useGL.h"
#include "Scene.h"

class KandataGame {
    CScene *pScene;
    GameCore game;
public:
    // コンストラクタ
    KandataGame(int w, int h) : pScene(NULL), game(w, h) {}
    
    void Initialize();
    void Update();
    void Draw();
    void Finalize();
    
    GameCore *GetGame() {
        return &game;
    }
};

#endif /* defined(__KandataGame__KandataGame__) */
