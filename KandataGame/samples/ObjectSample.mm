//
//  ObjectSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "ObjectSample.h"
#include "Sprite.h"

void ObjectSample::Init(GameObjList *pObjList) {
    texture = Get_pGame()->GetTextureMgr()->GetTexture("sampleImage");
}

void ObjectSample::Move(GameObjList *pObjList) {
    
}

void ObjectSample::Draw() {
    CSprite::DrawRotScl(texture, x, y, sclX, sclY, rotation);
}