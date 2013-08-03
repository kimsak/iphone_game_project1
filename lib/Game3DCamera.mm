//
//  Game3DCamera.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Game3DCamera.h"

/*static*/void Game3DCamera::UpdateViewProj(GLuint program, Game3DCamera *pCamera) {
    if(program == 0 || pCamera == NULL) return;
    
    // Uniform変数の設定
    // viewMatrix
    GLuint viewLoc = glGetUniformLocation(program, "viewMatrix");
    CMatrix4 viewMat = CMatrix4::LookAt(pCamera->position,
                                        pCamera->position + pCamera->rotation.Rotate(-AXIS_Z),
                                        pCamera->rotation.Rotate(AXIS_Y));
    glUniformMatrix4fv(viewLoc, 1, GL_FALSE, (const float *)&viewMat);
    
    // projMatrix
    GLuint projLoc = glGetUniformLocation(program, "projMatrix");
    CMatrix4 projMat = CMatrix4::Perspective(pCamera->fov,
                                             pCamera->Get_pGame()->GetDisplayAspect(),
                                             pCamera->nearClip, pCamera->farClip);
    glUniformMatrix4fv(projLoc, 1, GL_FALSE, (const float *)&projMat);
}