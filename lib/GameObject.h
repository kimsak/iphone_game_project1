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
    
    virtual void Init() = 0;
    virtual void Move(GameObjList *pObjList) = 0;
    virtual void Draw() = 0;
    
    GameCore *Get_pGame() {
        return pGame;
    }
};

/**
 *  オブジェクトの初期化を以上する関数（インライン）
 *  使い方：オブジェクトの生成時に以下のように書く
 *      pObj = InitObj( new SampleObj(game) );
 */
inline GameObject *InitObj(GameObject *pObj) {
    if(pObj) pObj->Init();
    return pObj;
}

#endif /*GAME_OBJECT_H_*/
