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

void SceneSample::LoadContent() {
    
    /**
     *  イメージのロード sampleImage.png
     */
    GetGameRef().GetTextureMgr()->CreateTexture("sampleImage", "sampleImage", "png");
}

void SceneSample::Init() {
    
}

void SceneSample::Update() {
    
}

void SceneSample::Draw() {
    CTexture *pTexture = GetGameRef().GetTextureMgr()->GetTexture("sampleImage");
    CSprite::DrawRotScl(pTexture, 0, 0, 1, 1, 0);
}

