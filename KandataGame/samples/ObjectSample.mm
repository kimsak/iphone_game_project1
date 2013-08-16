//
//  ObjectSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "ObjectSample.h"
#include "Sprite.h"

void ObjectSample::Init() {
    // テクスチャの設定
    SetTexture( Get_pGame()->GetTextureMgr()->GetTexture("MyShip") );
}

void ObjectSample::Move() {
    
}

void ObjectSample::Draw() {
    CSprite(x+100, y+200, color).DrawRotScl(GetTexture(), sclX, sclY, rotation);
}
