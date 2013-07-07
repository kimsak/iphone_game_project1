//
//  ShaderManager.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/22.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "ShaderManager.h"
#include "source_loader.h"

const int LOG_BUF_SIZE = 2048;

// シェーダーの作成
bool ShaderManager::CreateShader(std::string name, std::string vertexSrcPath, std::string fragmentSrcPath) {
    // 入力した名前がすでに存在してるかどうか調べる。
    // 登録されていたらfalseを返す。
    if( GetProgram(name) ) return false;
    
    // ソースの中身を読み込む
    const char *vSrcData, *fSrcData;
    if( !::LoadSourceData(vertexSrcPath.c_str(), fragmentSrcPath.c_str(), &vSrcData, &fSrcData)) {
        return false;
    }
    
    // シェーダーをビルドする
    GLuint program;
    if ( !LoadShader(vSrcData, fSrcData, &program) ) {
        return false;
    }
    
    // TODO: シェーダーの登録
    shader_map[name] = program;
    
    return true;
}

// シェーダーを取得する
unsigned int ShaderManager::GetProgram(std::string name) {
    return shader_map.find(name) != shader_map.end() ? shader_map[name] : 0;
}

// シェーダーの全破棄
void ShaderManager::Dispose() {
    for (std::map<std::string, unsigned int>::iterator it=shader_map.begin(); it!=shader_map.end(); it++) {
        glDeleteProgram(it->second);
    }
    shader_map.clear();
}

// シェーダープログラムのロード
bool ShaderManager::LoadShader(const char *vSrc, const char *fSrc, unsigned int *pShader) {
    GLuint vtxID, frgID;
    GLint pgLink;
    
    // 各ソースのコンパイル
    if( !CompileShader(GL_VERTEX_SHADER, vSrc, &vtxID) ) return false;
    if( !CompileShader(GL_FRAGMENT_SHADER, fSrc, &frgID) ) {
        glDeleteShader(vtxID);
        return false;
    }
    
    // リンク処理
    unsigned int program = glCreateProgram();
    
    // シェーダーオブジェクトの登録
    glAttachShader(program, vtxID);
    glAttachShader(program, frgID);
    
    // シェーダーオブジェクトの削除
    glDeleteShader(vtxID);
    glDeleteShader(frgID);
    
    // プログラムオブジェクトのリンク
    glLinkProgram(program);
    glGetProgramiv(program, GL_LINK_STATUS, &pgLink);
    if(pgLink==GL_FALSE) {
        fprintf(stderr, "Link Error!\n");
        // ログの出力
        {
        int length, logSize;
        glGetProgramiv(program, GL_INFO_LOG_LENGTH, &logSize);
        if(logSize>1) {
            char buf[LOG_BUF_SIZE];
            glGetProgramInfoLog(program, LOG_BUF_SIZE, &length, buf);
            fprintf(stderr, "%s\n", buf);
        }
        }
        glDeleteProgram(program);
        *pShader = 0;
        return false;
    }
    
    *pShader = program;               // 値コピー

    return true;
}

// シェーダーのコンパイル
bool ShaderManager::CompileShader(GLenum shader_type, const char *src, unsigned int *pShaderObj) {
    if(pShaderObj==NULL) return false;
    GLint compileResult;
    
    // シェーダーオブジェクトの作成
    GLuint shaderID = glCreateShader(shader_type);
    
    // シェーダーオブジェクトに読み込む
    glShaderSource(shaderID, 1, (const GLchar **)&src, NULL);
    // シェーダーオブジェクトのコンパイル
    glCompileShader(shaderID);
    glGetShaderiv(shaderID, GL_COMPILE_STATUS, &compileResult);
    
    //	printShaderInfoLog(shaderID);		// コンパイルログの出力
    if(compileResult==GL_FALSE) {
        fprintf(stderr, "Compile Error!\n");
        // ログの出力
        {
        int length, logSize;
        glGetShaderiv(*pShaderObj, GL_INFO_LOG_LENGTH, &logSize);
        if(logSize>1) {
            char buf[LOG_BUF_SIZE];
            glGetShaderInfoLog(*pShaderObj, LOG_BUF_SIZE, &length, buf);
            fprintf(stderr, "%s\n", buf);
        }
        }
        glDeleteShader(shaderID);
        *pShaderObj = 0;
        return false;
    }
    
    *pShaderObj = shaderID;
    return true;
}