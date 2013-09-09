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
public:
    // コンストラクタ
    MyShip(GameCore *pGame) : Game2DObject(pGame) {
        // タッチリスナーの登録
        pGame->GetInputMgr()->AddTouchListener(this);
    }
    
    // デストラクタ
    virtual ~MyShip() {
        // タッチリスナーの解除
        Get_pGame()->GetInputMgr()->RemoveTouchListener(this);
    }
    
    virtual void Init();
    virtual void Move();
    virtual void Draw();
    
    virtual void OnTouchAction(const TouchData &touch);
};

#endif /* defined(__KandataGame__MyShip__) */
