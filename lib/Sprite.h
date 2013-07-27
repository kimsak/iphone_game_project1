//
//  Sprite.h
//  iOS_Sample2
//
//  Created by 木村 裕作 on 2013/04/07.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef SPRITE_H_
#define SPRITE_H_
#include "Color.h"

class CTexture;
class CRectangle;
class GameCore;

class CSprite {
    static unsigned int shader_program;
    static float displayWidth, displayHeight;
    
    // インスタンス変数
    float x;
    float y;
    Color color;
public:
    /**
     *  スプライトクラスの初期化処理
     *  @param pGame ゲームコアクラスのポインタ
     */
    static void Initialize(GameCore *pGame);
    
    /**
     *  終了前処理
     */
    static void Fianlize();
    
    /**
     *  コンストラクタ
     */
    CSprite(float _x, float _y, const Color &_color) : x(_x), y(_y), color(_color) {}
	
    /**
     *  スプライト描画関数
     *  @param x 描画位置(x座標)
     *  @param y 描画位置(y座標)
     *  @param sclX 描画するスプライトの伸縮倍率(x方向)
     *  @param sclY 描画するスプライトの伸縮倍率(y方向)
     */
    
	void DrawRotScl(CTexture *texture, float sclX, float sclY, float rad);
    
	void Draw(CTexture *texture);
	void DrawRect(CTexture *texture, const CRectangle& srcRect, const CRectangle& destRect);
};

#endif // SPRITE_H_
