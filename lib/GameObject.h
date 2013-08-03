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
#include <string>

class GameObjList;

class GameObject {
    GameCore *pGame;
    
    // 名前
    std::string name;
public:
    // コンストラクタ
    GameObject(GameCore *gamePtr) : pGame(gamePtr) {}
    virtual ~GameObject() {}
    
    virtual void Init(GameObjList *pObjList) = 0;
    virtual void Move(GameObjList *pObjList) = 0;
    virtual void Draw() = 0;
    
    GameCore *Get_pGame() const {
        return pGame;
    }
    
    void SetName(std::string name) {
        this->name = name;
    }
    
    std::string GetName() const {
        return name;
    }
};

#endif /*GAME_OBJECT_H_*/
