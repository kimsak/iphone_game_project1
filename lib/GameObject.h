//
//  GameObject.h
//  iOSSample4
//
//  Created by 木村 裕作 on 2013/05/22.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef GAME_OBJECT_H_
#define GAME_OBJECT_H_
#include "GameCore.h"

class GameObjList;

class GameObject {
    GameCore *pGame;
public:
    // コンストラクタ
    GameObject(GameCore *gamePtr) : pGame(gamePtr) {}
    virtual ~GameObject() {}
    
    virtual void Init(GameObjList *pObjList) = 0;
    virtual void Move(GameObjList *pObjList) = 0;
    virtual void Draw() = 0;
    
    GameCore *Get_pGame() {
        return pGame;
    }
};

#endif /*GAME_OBJECT_H_*/
