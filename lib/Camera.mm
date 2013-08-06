//
//  Camera.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/06.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Camera.h"

void Camera::UpdateView(const GLuint program, const CMatrix4 &vm, const CMatrix4 &pm) {
    if(program == 0) return;
    
    GLuint viewLoc = glGetUniformLocation(program, "viewMatrix");
    glUniformMatrix4fv(viewLoc, 1, GL_FALSE, (const float *)&vm);
    
    GLuint projLoc = glGetUniformLocation(program, "projMatrix");
    glUniformMatrix4fv(projLoc, 1, GL_FALSE, (const float *)&pm);
}