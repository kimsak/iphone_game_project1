//
//  Game2DObject.h
//  iOSSample4
//
//  Created by 木村 裕作 on 2013/06/08.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef GAME_2D_OBJECT_H_
#define GAME_2D_OBJECT_H_
#include "GameObject.h"
#include "Color.h"
#include "Texture.h"

class Game2DObject : public GameObject {
public:
    float x, y;
    float sclX, sclY;
    float rotation;
    
    Color color;
    
    CTexture *texture;
    
    /**
     *  コンストラクタ
     */
    Game2DObject(GameCore &gameRef) : GameObject(gameRef), x(0.0f), y(0.0f), sclX(1.0f), sclY(1.0f),
    rotation(0.0f), color(), texture(0) {}
};

#endif
