//
//  Camera3DSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/12.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Camera3DSample.h"

const char *CAMERA_NAME = "Camera";

void SampleCamera::Init() {
    Camera *pCamera = (new Camera)->SetFov(45.0f)->SetFarClip(1000.0f);
    SetValue(CAMERA_NAME, pCamera);
    
    position.Z = 2;
}

SampleCamera::~SampleCamera() {
    // カメラオブジェクトの破棄
    Camera *pCamera = (Camera *)GetValue(CAMERA_NAME);
    if(pCamera) delete pCamera;
}

void SampleCamera::Move() {
    position.Z += 0.01f;
    
    Camera *pCamera = (Camera *)GetValue(CAMERA_NAME);
    pCamera->Update(Get_pGame()->GetShaderMgr()->GetProgram("Basic3D"), this);
}
