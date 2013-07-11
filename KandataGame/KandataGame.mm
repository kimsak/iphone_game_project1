//
//  KandataGame.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/16.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//
#include "Math.h"
#include "KandataGame.h"

#include "Sprite.h"

#include "SampleScene.h"

void KandataGame::Initialize() {
    /**
     *  GLの初期化
     */
    glEnable(GL_TEXTURE_2D);
	glEnable(GL_DEPTH_TEST);
	
	// アルファブレンドの設定
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    glEnable(GL_CULL_FACE);
    glCullFace(GL_CCW);
    
    /**
     *  シェーダーの読込
     */
    // Basic
    shaderManager.CreateShader("Basic", "Basic", "Basic");
    // Basic3D
    shaderManager.CreateShader("Basic3D", "Basic3D", "Basic3D");
    
    /**
     *  スプライトの設定
     */
    CSprite::SetDisplaySize(GetDisplayWidth(), GetDisplayHeight());
    CSprite::SetShaderProgram( shaderManager.GetProgram("Basic") );
//    else NSLog(@"No Shader");
    
    /**
     *  イメージのロード
     *  sampleImage
     */
    const char *sample_image_name = "sampleImage";
    textureManager.CreateTexture(sample_image_name, sample_image_name, "png");
    
    /**
     *  シーンの作成
     */
    pScene = new SampleScene(*this);
    pScene->Init();
}

void KandataGame::Update() {
    if(pScene) pScene->Update();
}

void KandataGame::Draw() {
    glViewport(0, 0, GetDisplayWidth(), GetDisplayHeight());
    
    glClearColor(1, 1, 0, 1);
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    if(pScene) pScene->Draw();
}

