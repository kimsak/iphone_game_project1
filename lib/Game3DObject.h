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
#include "AbstractModel.h"

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
    Game3DObject(GameCore *gamePtr)
    : GameObject(gamePtr), position(), scale(1,1,1), rotation(), color(), pModel(NULL) {}
};

#endif /*GAME_3D_OBJECT*/
