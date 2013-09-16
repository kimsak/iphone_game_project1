//
//  MyShip.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/09.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef __KandataGame__MyShip__
#define __KandataGame__MyShip__

#include "Game2DObject.h"
#include "ITouchListener.h"

class MyShip : public Game2DObject, public ITouchListener {
    KMPoint2D targetPos;
    TouchKey keyTouch;
    
    // MyShipの状態を表す変数
    enum {
        STATE_FREE = 0, STATE_DRAGGED,
    } state;
public:
    // コンストラクタ
    MyShip(GameCore *pGame, float initX = 0.0f, float initY = 0.0f) : Game2DObject(pGame), keyTouch(NO_TOUCH_KEY) {
        x = initX, y = initY;
        state = STATE_FREE;
        
        // タッチリスナーの登録
        pGame->GetInputMgr()->AddTouchListener(this);
    }
    
    // デストラクタ
    virtual ~MyShip() {
        Get_pGame()->GetInputMgr()->RemoveTouchListener(this);
    }
    
    virtual void Init();
    virtual void Move();
    virtual void Draw();
    
    virtual void OnTouchAction(const TouchData &touch);
};

#endif /* defined(__KandataGame__MyShip__) */
