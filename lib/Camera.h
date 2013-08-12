//
//  Camera.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/06.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef CAMERA_H_
#define CAMERA_H_
#include "Math.h"
#include "_useGL.h"
#include "Component.h"

class Camera : public IComponent {
    float fovy;
    float nearClip;
    float farClip;
public:
    /**
     *  コンストラクタ
     */
    Camera() : fovy(30.0f), nearClip(1.0f), farClip(100.0f) {}
    
    void SetFov(float f) {
        if(f > 0) fovy = f;
    }
    
    void SetNearClip(float nearClip) {
        if(nearClip > 0) this->nearClip = nearClip;
    }
    
    void SetFarClip(float farClip) {
        if(farClip > nearClip) this->farClip = farClip;
    }
    
    float GetFov() const        { return fovy; }
    float GetNearClip() const   { return nearClip; }
    float GetFarClip() const    { return farClip; }
    
    void Update(const GLuint program, const CMatrix4 &vm, const CMatrix4 &pm);
};

#endif /* defined(CAMERA_H_) */
