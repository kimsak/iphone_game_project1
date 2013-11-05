//
//  Shader.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/10/10.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Shader.h"

Shader::Shader() : programID(0) {
    
}

Shader::~Shader() {
    if (programID != 0) {
        glDeleteProgram(programID);
    }
}