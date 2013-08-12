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
#include "AbstractObject.h"
#include <list>

class GameObject;
typedef std::list<GameObject *> GameObjList;

class GameObject : public AbstractObject {
    GameCore *pGame;
protected:
    // 子オブジェクトリスト
    GameObjList objChildren;
public:
    // コンストラクタ
    GameObject(GameCore *gamePtr) : AbstractObject(), pGame(gamePtr) {}
    virtual ~GameObject() {}
    
    // 子オブジェクトリストに新しいオブジェクトを登録
    virtual size_t RegisterChildObj(GameObject *pObj);
    
    virtual bool UpdateObj();
    virtual bool DrawObj();
    
    /**
     *  指定したオブジェクトの持つ子オブジェクトたちを引き継いで自身の子オブジェクトリストに追加していく。
     *  @param pObj 引き継ぐオブジェクトたちの親オブジェクト
     */
    void UnderTake(GameObject *pObj);
    
    GameCore *Get_pGame() const {
        return pGame;
    }
};

#endif /*GAME_OBJECT_H_*/
