//
//  Game3DObject.h
//
//  Created by 木村 裕作 on 2013/05/22.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef GAME_3D_OBJECT
#define GAME_3D_OBJECT
#include "GameObject.h"
#include "Math.h"
#include "Color.h"

class AbstractModel;

class Game3DObject : public GameObject {
public:
    CVector         position;
    CVector         scale;
    CQuaternion     rotation;
    
    Color           color;
    
    AbstractModel   *pModel;
    
    /**
     *  コンストラクタ
     */
    Game3DObject(GameCore *gamePtr) : GameObject(gamePtr), position(), scale(1,1,1), rotation(), color(), pModel(NULL) {}

    // 描画メソッド
    // @Override
    virtual void Draw() {
        if(pModel) pModel->Render(this);
    }


};

#endif /*GAME_3D_OBJECT*/
