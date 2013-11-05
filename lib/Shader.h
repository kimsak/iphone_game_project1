//
//  Shader.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/10/10.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef SHADER_H_
#define SHADER_H_

#include "_useGL.h"

class Shader {
    GLuint  programID;
    
public:
    // コンストラクタ
    Shader();
    
    // デストラクタ
    ~Shader();
    
    
};

#endif /* defined(__KandataGame__Shader__) */
