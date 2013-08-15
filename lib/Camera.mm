//
//  Camera.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/06.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//
#include "Game3DObject.h"
#include "Camera.h"

void Camera::Update(const GLuint program, const Game3DObject *pObj) {
    if(program == 0) return;
    glUseProgram(program);
    
    CMatrix4 vm = CMatrix4::LookAt(pObj->position,
                                   pObj->position + pObj->rotation.Rotate(-AXIS_Z),
                                   pObj->rotation.Rotate(AXIS_Y));
    CMatrix4 pm = CMatrix4::Perspective(fovy, pObj->Get_pGame()->GetDisplayAspect(), nearClip, farClip);
    
    
    GLuint viewLoc = glGetUniformLocation(program, "viewMatrix");
    glUniformMatrix4fv(viewLoc, 1, GL_FALSE, (const float *)&vm);
    
    GLuint projLoc = glGetUniformLocation(program, "projMatrix");
    glUniformMatrix4fv(projLoc, 1, GL_FALSE, (const float *)&pm);
    
    glUseProgram(0);
}
