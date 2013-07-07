//
//  Scene.h
//  iOS_Sample2
//
//  Created by 木村 裕作 on 2013/03/30.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef SCENE_H_
#define SCENE_H_

class BaseGame;

class CScene {
    BaseGame &game;
public:
    // コンストラクタ
    CScene(BaseGame &gameRef) : game(gameRef) {}
    virtual ~CScene() {}
    
    // Virtual functions
    virtual void LoadContents() = 0;
    virtual void Init() = 0;
    virtual void Update() = 0;
    virtual void Draw() = 0;
    
    BaseGame &GetGameRef() { return game; }
};

#endif /*SCENE_H_*/
