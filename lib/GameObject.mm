//
//  GameObject.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/12.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "GameObject.h"

size_t GameObject::RegisterChildObj(GameObject *pObj) {
    if(pObj) {
        pObj->Init();   // オブジェクトの初期化
        objChildren.push_back(pObj);
        
        return sizeof(*pObj);
    }
    return 0;
}

bool GameObject::UpdateObj() {
    // 自身のオブジェクトを更新
    bool isAlive = this->Move();
    
    // 子オブジェクトの更新
    for (GameObjList::iterator it = objChildren.begin(); it != objChildren.end(); ) {
        if ( (*it)->UpdateObj() == false ) {
            // 子オブジェクトの中身を親が引き継ぐ
            UnderTake(*it);
            
            // リストから排除し、自身も解放
            delete *it;
            it = objChildren.erase(it);
            continue;
        }
        ++it;
    }
    
    return isAlive;
}

bool GameObject::DrawObj() {
    // 自身のオブジェクトの描画
    this->Draw();
    
    // 子オブジェクトの描画
    for (GameObjList::const_iterator it = objChildren.begin(); it != objChildren.end(); ++it) {
        (*it)->DrawObj();
    }
    
    return true;
}

void GameObject::UnderTake(GameObject *pObj) {
    // 子オブジェクトリストの中身をコピーする
    for (GameObjList::iterator it = pObj->objChildren.begin(); it != pObj->objChildren.end(); ++it) {
        objChildren.push_back(*it);
    }
    
    // コピー元のオブジェクトリストを空にする
    pObj->objChildren.clear();
}
