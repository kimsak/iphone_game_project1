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

void SceneSample::LoadContents() {
    
    /**
     *  イメージのロード sampleImage.png
     */
    GetGameRef().GetTextureMgr()->CreateTexture("sampleImage", "sampleImage", "png");
}

void SceneSample::Init() {
    
}

void SceneSample::Update() {
    objList.Move();
}

void SceneSample::Draw() {
    objList.Draw();
}

