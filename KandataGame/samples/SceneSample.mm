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
#include "ObjectSample.h"
#include "Object3DSample.h"

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
    // ルートオブジェの生成
    pRoot = new GameObject(Get_pGame());
    pRoot->SetName("Root");
    
    // 3D描画用ルートオブジェクトの生成＆Root下に登録
    GameObject *p3D_root_obj = new GameObject(Get_pGame());
    p3D_root_obj->SetName("3DRoot");
    pRoot->RegisterChildObj(p3D_root_obj);
    
    // 2D描画用ルートオブジェクトの生成＆Root下に登録
    GameObject *p2D_root_obj = new GameObject(Get_pGame());
    p2D_root_obj->SetName("2DRoot");
    pRoot->RegisterChildObj(p2D_root_obj);
    
    // 2D用サンプルオブジェクトの生成＆2DRoot下に登録
    ObjectSample *p2DSample = new ObjectSample(Get_pGame());
    p2D_root_obj->RegisterChildObj(p2DSample);
    
    // 3Dサンプルオブジェクトの生成＆3DRoot下に登録
    Sample3DObj *p3DSample = new Sample3DObj(Get_pGame());
    p3D_root_obj->RegisterChildObj(p3DSample);
}

void SceneSample::Update() {
    pRoot->UpdateObj();
    
    // 3Dカメラの更新
    CMatrix4 view3DMat = CMatrix4::LookAt(AXIS_Z*10.0f,
                                          VEC_ZERO,
                                          AXIS_Y);
    CMatrix4 proj3DMat = CMatrix4::Perspective(30.0f,
                                               Get_pGame()->GetDisplayAspect(),
                                               1.0f, 100.0f);
    camera.Update(Get_pGame()->GetShaderMgr()->GetProgram("Basic3D"), view3DMat, proj3DMat);
}

void SceneSample::Draw() {
    pRoot->DrawObj();
}

