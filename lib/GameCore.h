//
//  GameCore.h
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

class GameCore {
    int displayWidth, displayHeight;
    
    TextureManager      textureManager;
    ShaderManager       shaderManager;
public:
    
    GameCore(int w = 1, int h = 1) : displayWidth(w), displayHeight(h) {}
    
    virtual ~GameCore() {}
    
    // These three methods are deprecated.
    virtual void Initialize() {}
    virtual void Update() {}
    virtual void Draw() {}
    
    virtual void Finalize() {
        textureManager.Dispose();
        shaderManager.Dispose();
    };
    
    int GetDisplayWidth() const { return displayWidth; }
    int GetDisplayHeight() const { return displayHeight; }
    float GetDisplayAspect() const { return (float)displayWidth/displayHeight; }
    
    ShaderManager *GetShaderManager() {
        return &shaderManager;
    }
    
    TextureManager *GetTextureManager() {
        return &textureManager;
    }
    
    CTexture *GetTexture(std::string name) const {
        return textureManager.GetTexture(name);
    }
};

#endif
