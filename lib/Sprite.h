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
class CGraphicDevice;
class CRectangle;

class CSprite {
    static unsigned int shader_program;
    
	static Color color;
    static float displayWidth, displayHeight;
public:
    static void SetShaderProgram(unsigned int program) {
        if(program) shader_program = program;
    }
    
    static void SetDisplaySize(float w, float h) {
        displayWidth = w, displayHeight = h;
    }
	static void SetAlpha(float a=1.0f) { color.A = a; }
	
	static void Draw(CTexture *texture, int x, int y);
	static void DrawRotScl(CTexture *texture, int x, int y, float sclX, float sclY, float rad);
	
	static void DrawRect(CTexture *texture, const CRectangle& srcRect, const CRectangle& destRect);
};

#endif // SPRITE_H_
