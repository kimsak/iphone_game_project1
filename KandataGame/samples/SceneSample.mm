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
     *  イメージのロード sampleImage.png
     */
    Get_pGame()->GetTextureMgr()->CreateTexture("sampleImage", "sampleImage", "png");
    
}

void SceneSample::Init() {
    objList.Push( new ObjectSample(Get_pGame()) );
    obj3DList.Push( new Sample3DObj(Get_pGame()) );
}

void SceneSample::Update() {
    objList.Move();
    obj3DList.Move();
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
    
    /**
     *  Basic3Dシェーダーの設定
     */
    GLuint program = Get_pGame()->GetShaderMgr()->GetProgram("Basic3D");
    glUseProgram(program);
    // Uniform変数の設定
    // viewMatrix
    GLuint viewLoc = glGetUniformLocation(program, "viewMatrix");
    CMatrix4 view3DMat = CMatrix4::LookAt(AXIS_Z*10.0f,
                                        VEC_ZERO,
                                        AXIS_Y);
    glUniformMatrix4fv(viewLoc, 1, GL_FALSE, (const float *)&view3DMat);
    
    // projMatrix
    GLuint projLoc = glGetUniformLocation(program, "projMatrix");
    CMatrix4 proj3DMat = CMatrix4::Perspective(30.0f,
                                             Get_pGame()->GetDisplayAspect(),
                                             1.0f, 100.0f);
    glUniformMatrix4fv(projLoc, 1, GL_FALSE, (const float *)&proj3DMat);
    glUseProgram(0);
    
    obj3DList.Draw();
//    glClear(GL_DEPTH_BUFFER_BIT);
    objList.Draw();
}

