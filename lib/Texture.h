//
//  Texture.h
//  iOS_Sample2
//
//  Created by 木村 裕作 on 2013/03/30.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef iOS_Sample2_Texture_h
#define iOS_Sample2_Texture_h
#include "Component.h"

class CTexture : public IComponent {
    unsigned int textureID;
    int width, height;
public:
    CTexture(int w=-1, int h=-1);
    ~CTexture();
    
    void SetTextureSize(int w, int h) {
        width = w, height = h;
    }
    
    unsigned GetID() const { return textureID; }
    int GetWidth() const { return width; }
    int GetHeight() const { return height; }
    float GetAspect() const { return (float)width/height; }
    
};


#endif
