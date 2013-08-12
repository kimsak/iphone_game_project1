//
//  Game2DObject.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/07/21.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Game2DObject.h"
#include "_useGL.h"
#include "Math.h"

// 頂点データ
// 左上原点
static float points[] = {
    //	-1, -1, 0,
    //	1, -1, 0,
    //	-1, 1, 0,
    //	1, 1, 0
	0, -1, 0,
	1, -1, 0,
	0, 0, 0,
	1, 0, 0
};

// 頂点データ（別）
// 原点中心
static float points2[] = {
    -1, -1, 0,
    1, -1, 0,
    -1, 1, 0,
    1, 1, 0
};

// UV座標
static float tex_coords[] = {
	0, 1,
	1, 1,
	0, 0,
	1, 0
};


bool Game2DObject::Draw() {
    // テクスチャの有無を確認
    if(!GetTexture()) {
        return false;
    }
    
    // シェーダー識別子の取得(Basic.vsh,fsh)
    GLuint programID = Get_pGame()->GetShaderMgr()->GetProgram("Basic");
    if(programID == 0) return false; // 0（取得なし）であったら関数終了
    
    // シェーダーの設定
    glUseProgram(programID);
    
    /**
     *  Attribute変数の設定
     */
    // position
	GLuint posLoc = glGetAttribLocation(programID, "position");
	glEnableVertexAttribArray(posLoc);
	glVertexAttribPointer(posLoc, 3, GL_FLOAT, GL_FALSE, sizeof(float)*3, points2);
	// texcoord
	GLuint texCoordLoc = glGetAttribLocation(programID, "texcoord");
	glEnableVertexAttribArray(texCoordLoc);
	glVertexAttribPointer(texCoordLoc, 2, GL_FLOAT, GL_FALSE, sizeof(float)*2, tex_coords);
    
    /**
	 *	Uniform変数の設定
	 */
	// monoColor
    //	float color[] = {1,1,1,1};
	GLuint colorLoc = glGetUniformLocation(programID, "monoColor");
	glUniform4fv(colorLoc, 1, (const float *)&color);
	
	// sampler
	GLuint texLoc = glGetUniformLocation(programID, "sampler");
	glUniform1i(texLoc, 0);		// テクスチャユニットを0に設定
	    
    // modelViewProjectionMatrix
	// 行列変換
    // wldMat
    GLuint wmLoc = glGetUniformLocation(programID, "wldMat");
    CMatrix4 wldMat = CMatrix4::Scale(CVector(sclX, sclY, 1));
    wldMat *= CMatrix4::Rotation(CQuaternion(rotation, AXIS_Z));
    wldMat *= CMatrix4::Translation(CVector(x, y, z));
    glUniformMatrix4fv(wmLoc, 1, GL_FALSE, (const float *)&wldMat);
    
	// texMatrix
	GLuint tmLoc = glGetUniformLocation(programID, "texMatrix");
	CMatrix4 tmMat;
	glUniformMatrix4fv(tmLoc, 1, GL_FALSE, (const float *)&tmMat);
    
	// テクスチャの設定
	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, GetTexture()->GetID());

	/**
	 *	描画
	 */
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
	// テクスチャの解除
	glBindTexture(GL_TEXTURE_2D, 0);
	
	/**
	 *	頂点座標の対応付けを解除する。
	 */
	glDisableVertexAttribArray(texCoordLoc);
	glDisableVertexAttribArray(posLoc);
	
	/**
	 *	シェーダーの解除
	 */
	glUseProgram(0);
    
    return true;
}