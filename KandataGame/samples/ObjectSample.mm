//
//  ObjectSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "ObjectSample.h"
#include "Sprite.h"

bool ObjectSample::Init() {
    // テクスチャの設定
    SetTexture( Get_pGame()->GetTextureMgr()->GetTexture("MyShip") );
    
    return true;
}

bool ObjectSample::Move() {
    return true;
}

bool ObjectSample::Draw() {
    CSprite(x, y, color).DrawRotScl(GetTexture(), sclX, sclY, rotation);
    return true;
}
