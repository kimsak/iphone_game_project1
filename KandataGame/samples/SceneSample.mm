//
//  SceneSample.mm
//  KandataGame
//  テクスチャの表示と回転を行うサンプル
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "SceneSample.h"
#include "GameCore.h"
#include "Sprite.h"
#include "MyShip.h"
#include "Object3DSample.h"
#include "Camera3DSample.h"

#include "Math.h"
#include "_useGL.h"

void SceneSample::LoadContents() {
    /**
     *  イメージのロード sampleImage.png MyShip.png
     */
    Get_pGame()->GetTextureMgr()->CreateTexture("sampleImage", "sampleImage", "png");
    Get_pGame()->GetTextureMgr()->CreateTexture("MyShip", "MyShip", "png");
    
    /**
     *  Basicシェーダーの設定
     *  Camera, Projection
     */
    GLuint programID = Get_pGame()->GetShaderMgr()->GetProgram("Basic");
    glUseProgram(programID);
    // viewMat
    GLuint vmLoc = glGetUniformLocation(programID, "viewMat");
    CMatrix4 viewMat = CMatrix4::LookAt(CVector(0, 0, 10), VEC_ZERO, AXIS_Y);
    glUniformMatrix4fv(vmLoc, 1, GL_FALSE, (const float *)&viewMat);
    // projMat
    GLuint pmLoc = glGetUniformLocation(programID, "projMat");
    float as = Get_pGame()->GetDisplayAspect();     // ディスプレイのアスペクト比を取得
    CMatrix4 projMat = CMatrix4::Orthof(-1, 1, 1.0f/as, -1.0f/as, 1, 100);
    glUniformMatrix4fv(pmLoc, 1, GL_FALSE, (const float *)&projMat);
	glUseProgram(0);
}

void SceneSample::Init() {
    // 2D, 3DRootオブジェクトの生成
    GameObject *p2D = pRoot->RegisterChildObj( (new GameObject(Get_pGame())) );
    p2D->SetName("2DRoot");
    GameObject *p3D = pRoot->RegisterChildObj( (new GameObject(Get_pGame())) );
    p3D->SetName("3DRoot");
    
    // 2Dオブジェクトの生成
    p2D->RegisterChildObj(new MyShip(Get_pGame()));
    // 3Dオブジェクトの生成
    p3D->RegisterChildObj(new Sample3DObj(Get_pGame()));
    // 3Dサンプルカメラの生成
    p3D->RegisterChildObj(new SampleCamera(Get_pGame()));
}

void SceneSample::Update() {
    pRoot->UpdateObj();
}

void SceneSample::Draw() {
    pRoot->SearchObj("3DRoot")->DrawObj();
    glClear(GL_DEPTH_BUFFER_BIT);
    pRoot->SearchObj("2DRoot")->DrawObj();
}

