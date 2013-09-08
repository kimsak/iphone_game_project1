//
//  ObjectSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/13.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "ObjectSample.h"
#include "Sprite.h"
#include "InputManager.h"

void ObjectSample::Init() {
    // テクスチャの設定
    SetTexture( Get_pGame()->GetTextureMgr()->GetTexture("MyShip") );
    
    Get_pGame()->GetInputMgr()->AddTouchListener(this);
}

void ObjectSample::Move() {

}

void ObjectSample::Draw() {
    CSprite(x, y, color).DrawRotScl(GetTexture(), sclX, sclY, rotation);
}

ObjectSample::~ObjectSample() {
    Get_pGame()->GetInputMgr()->RemoveTouchListener(this);
}

void ObjectSample::OnTouchAction(const TouchData &touch) {
    if(touch.GetPhase() == KMTouchEnded) {
        KMPoint2D p = touch.GetCurrPos();
        x = p.x, y = p.y;
    }
}
