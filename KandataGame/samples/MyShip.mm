//
//  MyShip.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/09.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "MyShip.h"
#include "Sprite.h"

void MyShip::Init() {
    SetTexture(Get_pGame()->GetTextureMgr()->GetTexture("MyShip"));
    targetPos.x = 0, targetPos.y = 0;
    
//    color.A = 0.4f;
}

void MyShip::Move() {
    // 線形補完
//    x = Lerp(x, targetPos.x, 0.1f);
//    y = Lerp(y, targetPos.y, 0.1f);
    
//    rotation += 0.01f;
    
    if(keyTouch != NO_TOUCH_KEY) {
        const TouchData *touch = Get_pGame()->GetInputMgr()->GetTouchData(keyTouch);
        
        if(touch) {
            x = touch->GetCurrPos().x;
            y = touch->GetCurrPos().y;
        }
    }
}

void MyShip::Draw() {
    float tex_w = GetTexture()->GetOriginalW(), tex_h = GetTexture()->GetOriginalH();
    tex_w *= 0.5f, tex_h *= 0.5f;
    CSprite(x - tex_w, y - tex_h, color).DrawRotScl(GetTexture(), sclX, sclY, rotation);
}

void MyShip::OnTouchAction(const TouchData &touch) {
    switch (touch.GetPhase()) {
        case KMTouchBegan:
            if(keyTouch == NO_TOUCH_KEY) {
                KMPoint2D p = touch.GetCurrPos();
                
                CRectangle r(x, y, GetTexture()->GetOriginalW()/2, GetTexture()->GetOriginalH()/2);
                if(r.IsInside(p.x, p.y)) {
                    keyTouch = touch.GetTouchPtr();
                }
            }
            break;
            
        case KMTouchEnded:
        case KMTouchCancelled:
            if(keyTouch == touch.GetTouchPtr()) {
                keyTouch = NO_TOUCH_KEY;
            }
            
        default:
            break;
    }
}
