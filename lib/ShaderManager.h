//
//  ShaderManager.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/22.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef SHADER_MANAGER_H_
#define SHADER_MANAGER_H_
#include <map>
#include <string>
#include "_useGL.h"
#include "Math.h"

class ShaderManager {
    std::map<std::string, unsigned int> shader_map;
    
    bool LoadShader(const char *vSrc, const char *fSrc, unsigned int *pShader);
    bool CompileShader(GLenum shader_type, const char *src, unsigned int *pShaderObj);
public:
    /**
     *  シェーダーを作成する関数
     */
    bool CreateShader(std::string name, std::string vertexSrcPath, std::string fragmentSrcPath);
    
    /**
     *  シェーダーのプログラムIDを取得する関数
     */
    unsigned int GetProgram(std::string name);
    
    /**
     *  登録されているシェーダーの破棄
     */
    void Dispose();
    
};

#endif /* defined(SHADER_MANAGER_H_) */
