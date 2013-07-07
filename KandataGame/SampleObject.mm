//
//  SampleObject.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/02.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "SampleObject.h"
#include "BaseGame.h"

void SampleObject::Init() {
    texture = GetGameRef().GetTexture("sampleImage");
}

void SampleObject::Move(GameObjList *pObjList) {
    
}

void SampleObject::Draw() {
    
}
