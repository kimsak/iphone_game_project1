//
//  BaseGame.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/16.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef BASE_GAME_H_
#define BASE_GAME_H_
#include "Texture.h"
#include "ShaderManager.h"
#include "TextureManager.h"

typedef unsigned ShaderObject;

class BaseGame {
    int displayWidth, displayHeight;
public:
    TextureManager      textureManager;
    ShaderManager       shaderManager;
    
    BaseGame(int w = 1, int h = 1) : displayWidth(w), displayHeight(h) {}
    
    virtual ~BaseGame() {}
    
    virtual void Initialize() = 0;
    virtual void Update() = 0;
    virtual void Draw() = 0;
    virtual void Finalize() {
        textureManager.Dispose();
        shaderManager.Dispose();
    };
    
    int GetDisplayWidth() const { return displayWidth; }
    int GetDisplayHeight() const { return displayHeight; }
    float GetDisplayAspect() const { return (float)displayWidth/displayHeight; }
    
    CTexture *GetTexture(std::string name) {
        return textureManager.GetTexture(name);
    }
};

#endif
