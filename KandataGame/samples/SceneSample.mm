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

#include "Math.h"
#include "_useGL.h"

void SceneSample::LoadContents() {
    
    /**
     *  イメージのロード sampleImage.png
     */
    Get_pGame()->GetTextureMgr()->CreateTexture("sampleImage", "sampleImage", "png");
    
}

void SceneSample::Init() {
    objList.Push( new ObjectSample(Get_pGame()) );
}

void SceneSample::Update() {
    objList.Move();
}

void SceneSample::Draw() {
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
    
    objList.Draw();
}

