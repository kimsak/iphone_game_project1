//
//  Game3DCamera.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef GAME_3D_CAMERA_H_
#define GAME_3D_CAMERA_H_
#include "GameObject.h"
#include "Math.h"
#include "_useGL.h"

class Game3DCamera : public GameObject {
public:
    CVector     position;
    CQuaternion rotation;
    
    float       fov;
    float       nearClip, farClip;
    
    /**
     *  コンストラクタ
     */
    Game3DCamera(GameCore *pGame) : GameObject(pGame),
        position(), rotation(), fov(30.0f), nearClip(1.0f), farClip(100.0f) {}
    
    static void UpdateViewProj(GLuint program, Game3DCamera *pCamera);
};

#endif
