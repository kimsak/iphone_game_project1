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

#include "SceneSample.h"

void KandataGame::Initialize() {
    /**
     *  GLの初期化
     */
    glEnable(GL_TEXTURE_2D);        // 2Dテクスチャの有効
	glEnable(GL_DEPTH_TEST);        // 深度バッファの有効
    glDepthFunc(GL_LEQUAL);
	
	// アルファブレンドの設定
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    // カリングの設定（半時計回り）
    glEnable(GL_CULL_FACE);
    glCullFace(GL_CCW);
    
    /**
     *  シェーダーの読込
     */
    ShaderManager *shaderMgr = game.GetShaderMgr();
    // Basic
    shaderMgr->CreateShader("Basic", "Basic", "Basic");
    // Basic3D
    shaderMgr->CreateShader("Basic3D", "Basic3D", "Basic3D");
    
    /**
     *  スプライトの初期化
     */
    CSprite::Initialize(&game);
//    else NSLog(@"No Shader");
    
    /**
     *  シーンの作成
     */
    pScene = InitScene(new SceneSample(&game));
}

void KandataGame::Update() {
    if(pScene) pScene->Update();
}

void KandataGame::Draw() {
    glViewport(0, 0, game.GetDisplayWidth(), game.GetDisplayHeight());
    
    glClearColor(0, 0, 0.9f, 1);
    glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    if(pScene) pScene->Draw();
}

void KandataGame::Finalize() {
    if(pScene) delete pScene;
    game.Finalize();
}

