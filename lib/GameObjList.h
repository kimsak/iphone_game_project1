//
//  GameObjList.h
//
//  Created by 木村 裕作 on 2013/06/08.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef GAME_OBJ_LIST_H_
#define GAME_OBJ_LIST_H_
#include "GameObject.h"
#include <list>

typedef std::list<GameObject *> GameObjects;

class GameObjList {
    GameObjects objs;
public:
    void Push(GameObject *obj) {
        if(obj) objs.push_back(obj);
    }
    
    void Move() {
        for (GameObjects::iterator it = objs.begin(); it != objs.end(); it++) {
            (*it)->Move(this);
        }
    }
    
    void Draw() {
        for (GameObjects::iterator it = objs.begin(); it != objs.end(); it++) {
            (*it)->Draw();
        }
    }
    
    void Clear() {
        for (GameObjects::iterator it = objs.begin(); it != objs.end(); it++) {
            delete *it;
        }
        objs.clear();
    }
    
    
    // 当たり判定に使用
    void InteractWith(GameObject *me, void (*func)(GameObject *, GameObject *)) {
        for (GameObjects::iterator it = objs.begin(); it != objs.end(); it++) {
            if(me!=*it) func(me, *it);
        }
    }
    
    // 検索に使用
    GameObject *FindWith(bool (*func)(GameObject *)) {
        for (GameObjects::iterator it = objs.begin(); it != objs.begin(); it++) {
            if (func(*it)) return *it;
        }
        return NULL;
    }
};

#endif  /*GAME_OBJ_LIST_H_*/
