//
//  SampleScene.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/29.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "SampleScene.h"
#include "SampleObject.h"

void SampleScene::LoadContents() {
    
}

void SampleScene::Init() {
    GameObject *pObj = new SampleObject(GetGameRef());
    pObj->Init();
    gameObjs.Push(pObj);
}

void SampleScene::Update() {
    gameObjs.Move();
}

void SampleScene::Draw() {
    gameObjs.Draw();
}
