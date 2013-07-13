//
//  GameObject.h
//  iOSSample4
//
//  Created by 木村 裕作 on 2013/05/22.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef GAME_OBJECT_H_
#define GAME_OBJECT_H_

class GameObjList;
class GameCore;

class GameObject {
    GameCore &game;
public:
    // コンストラクタ
    GameObject(GameCore &gameRef) : game(gameRef) {}
    virtual ~GameObject() {}
    
    virtual void Init() = 0;
    virtual void Move(GameObjList *pObjList) = 0;
    virtual void Draw() = 0;
    
    GameCore &GetGameRef() {
        return game;
    }
};

#endif /*GAME_OBJECT_H_*/
