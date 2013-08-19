//
//  CubeModel.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/01.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "CubeModel.h"
#include "Game3DObject.h"

// 定数定義
const char *USE_SHADER_NAME = "Basic3D";

// 頂点データ
static GLfloat gCubeVertexData[216] =
{
    // Data layout for each line below is:
    // positionX, positionY, positionZ,     normalX, normalY, normalZ,
    0.5f, -0.5f, -0.5f,        1.0f, 0.0f, 0.0f,
    0.5f, 0.5f, -0.5f,         1.0f, 0.0f, 0.0f,
    0.5f, -0.5f, 0.5f,         1.0f, 0.0f, 0.0f,
    0.5f, -0.5f, 0.5f,         1.0f, 0.0f, 0.0f,
    0.5f, 0.5f, -0.5f,         1.0f, 0.0f, 0.0f,
    0.5f, 0.5f, 0.5f,          1.0f, 0.0f, 0.0f,
    
    0.5f, 0.5f, -0.5f,         0.0f, 1.0f, 0.0f,
    -0.5f, 0.5f, -0.5f,        0.0f, 1.0f, 0.0f,
    0.5f, 0.5f, 0.5f,          0.0f, 1.0f, 0.0f,
    0.5f, 0.5f, 0.5f,          0.0f, 1.0f, 0.0f,
    -0.5f, 0.5f, -0.5f,        0.0f, 1.0f, 0.0f,
    -0.5f, 0.5f, 0.5f,         0.0f, 1.0f, 0.0f,
    
    -0.5f, 0.5f, -0.5f,        -1.0f, 0.0f, 0.0f,
    -0.5f, -0.5f, -0.5f,       -1.0f, 0.0f, 0.0f,
    -0.5f, 0.5f, 0.5f,         -1.0f, 0.0f, 0.0f,
    -0.5f, 0.5f, 0.5f,         -1.0f, 0.0f, 0.0f,
    -0.5f, -0.5f, -0.5f,       -1.0f, 0.0f, 0.0f,
    -0.5f, -0.5f, 0.5f,        -1.0f, 0.0f, 0.0f,
    
    -0.5f, -0.5f, -0.5f,       0.0f, -1.0f, 0.0f,
    0.5f, -0.5f, -0.5f,        0.0f, -1.0f, 0.0f,
    -0.5f, -0.5f, 0.5f,        0.0f, -1.0f, 0.0f,
    -0.5f, -0.5f, 0.5f,        0.0f, -1.0f, 0.0f,
    0.5f, -0.5f, -0.5f,        0.0f, -1.0f, 0.0f,
    0.5f, -0.5f, 0.5f,         0.0f, -1.0f, 0.0f,
    
    0.5f, 0.5f, 0.5f,          0.0f, 0.0f, 1.0f,
    -0.5f, 0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    0.5f, -0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    0.5f, -0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    -0.5f, 0.5f, 0.5f,         0.0f, 0.0f, 1.0f,
    -0.5f, -0.5f, 0.5f,        0.0f, 0.0f, 1.0f,
    
    0.5f, -0.5f, -0.5f,        0.0f, 0.0f, -1.0f,
    -0.5f, -0.5f, -0.5f,       0.0f, 0.0f, -1.0f,
    0.5f, 0.5f, -0.5f,         0.0f, 0.0f, -1.0f,
    0.5f, 0.5f, -0.5f,         0.0f, 0.0f, -1.0f,
    -0.5f, -0.5f, -0.5f,       0.0f, 0.0f, -1.0f,
    -0.5f, 0.5f, -0.5f,        0.0f, 0.0f, -1.0f
};


void CubeModel::Render(const Game3DObject *pObj) {
    assert(pObj != NULL);
    
    GLuint program = pObj->Get_pGame()->GetShaderMgr()->GetProgram(USE_SHADER_NAME);
    if(program == 0) return;      // プログラム値が０だったら処理終了
    glUseProgram(program);
    
    /**
	 *	Attribute変数の設定
	 */
	// position
	GLint posLoc = glGetAttribLocation(program, "position");
	glEnableVertexAttribArray(posLoc);
	glVertexAttribPointer(posLoc, 3, GL_FLOAT, GL_FALSE, sizeof(float)*6, gCubeVertexData);
	// normal
	GLint nrmPos = glGetAttribLocation(program, "normal");
	glEnableVertexAttribArray(nrmPos);
	glVertexAttribPointer(nrmPos, 3, GL_FLOAT, GL_TRUE, sizeof(float)*6, gCubeVertexData+3);
	
	/**
	 *	Uniform変数の設定
	 */
	// worldMatrix
	CMatrix4
	scl = CMatrix4::Scale(pObj->scale),
	rot = CMatrix4::Rotation(pObj->rotation),
	trs = CMatrix4::Translation(pObj->position);
	CMatrix4 wld = scl * rot * trs;
	GLint wldPos = glGetUniformLocation(program, "worldMatrix");
	glUniformMatrix4fv(wldPos, 1, GL_FALSE, (const float *)&wld);
	// normalMatrix
	GLint nrmMatPos = glGetUniformLocation(program, "normalMatrix");
	glUniformMatrix4fv(nrmMatPos, 1, GL_FALSE, (const GLfloat *)&rot);
	// monoColor
	GLint colorLoc = glGetUniformLocation(program, "monoColor");
	glUniform4fv(colorLoc, 1, (const float *)&pObj->color);
	
	/**
	 *	描画
	 */
	glDrawArrays(GL_TRIANGLES, 0, 36);
	//	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
	glDisableVertexAttribArray(posLoc);
	glDisableVertexAttribArray(nrmPos);
    
    glUseProgram(0);
}
