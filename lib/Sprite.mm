//
//  CSprite.mm
//  iOS_Sample2
//
//  Created by 木村 裕作 on 2013/04/07.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//
#include "_useGL.h"
#include "Sprite.h"
#include "Math.h"
#include "Texture.h"

// 頂点データ
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

// クラス変数
/*static*/unsigned int CSprite::shader_program = 0;

/*static*/Color CSprite::color;
/*static*/float CSprite::displayWidth = 1;
/*static*/float CSprite::displayHeight = 1;

void CSprite::Draw(CTexture *texture, int x, int y) {
	if(texture==NULL) return;
//	DrawRotScl(texture, x, y, 1, 1, 0, device);
	CRectangle src, dest;
	src.SetSize(texture->GetWidth(), texture->GetHeight());
	dest.SetBounds(x, y, src.GetWidth(), src.GetHeight());
	DrawRect(texture, src, dest);
}

/**
 *	回転、伸縮の指定をしてテクスチャを描画する関数
 *	描画するテクスチャの座標は中心が基準
 */
void CSprite::DrawRotScl(CTexture *texture, int x, int y, float sclX, float sclY, float rad) {
	if(!texture || !shader_program) return;
	
	// シェーダーのプログラムID取得
	GLuint program = shader_program;
	/**
	 *	シェーダーの設定
	 */
	glUseProgram(program);
	
	/**
	 *	Atrribute変数の設定
	 */
	// position
	GLuint posLoc = glGetAttribLocation(program, "position");
	glEnableVertexAttribArray(posLoc);
	glVertexAttribPointer(posLoc, 3, GL_FLOAT, GL_FALSE, sizeof(float)*3, points2);
	// texcoord
	GLuint texCoordLoc = glGetAttribLocation(program, "texcoord");
	glEnableVertexAttribArray(texCoordLoc);
	glVertexAttribPointer(texCoordLoc, 2, GL_FLOAT, GL_FALSE, sizeof(float)*2, tex_coords);
	
	/**
	 *	Uniform変数の設定
	 */
	// monoColor
//	float color[] = {1,1,1,1};
	GLuint colorLoc = glGetUniformLocation(program, "monoColor");
	glUniform4fv(colorLoc, 1, (const float *)&color);
	
	// sampler
	GLuint texLoc = glGetUniformLocation(program, "sampler");
	glUniform1i(texLoc, 0);		// テクスチャユニットを0に設定
	
	// テクスチャの設定
	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, texture->GetID());
	
	// modelViewProjectionMatrix
	// 行列変換
	GLuint mvpLoc = glGetUniformLocation(program, "modelViewProjectionMatrix");
//	CMatrix4 mvpMat = CMatrix4::Scale(CVector(sclX*texture->GetWidth()/2.0f, sclY*texture->GetHeight()/2.0f, 1));
//	mvpMat *= CMatrix4::Rotation(CQuaternion(rad/(2*GL_PI), CVector(0, 0, 1)));
//	mvpMat *= CMatrix4::Translation(CVector(-device->GetWidth()/2.0f+x, device->GetHeight()/2.0f-y, 0));
//	mvpMat *= CMatrix4::LookAt(CVector(0, 0, 10), CVector(), CVector(0, 1, 0));
//	mvpMat *= CMatrix4::Orthof(-device->GetWidth()/2.0f, device->GetWidth()/2.0f, device->GetHeight()/2.0f, -device->GetHeight()/2.0f, 1, 100);
    
    // 変換行列の設定
    float t_x = sclX * texture->GetWidth() / 2 - displayWidth / 2 + x,
        t_y = -sclY * texture->GetHeight() / 2 + displayHeight / 2 - y;
    
	CMatrix4 mvpMat;
    mvpMat[0] = sclX * texture->GetWidth() * cosf(rad) / displayWidth;
    mvpMat[1] = -sclX * texture->GetWidth() * sinf(rad) / displayHeight;
    mvpMat[4] = sclY * texture->GetHeight() * sinf(rad) / displayWidth;
    mvpMat[5] = sclY * texture->GetHeight() * cosf(rad) / displayHeight;
    mvpMat[12] = 2 * t_x / displayWidth;
    mvpMat[13] = 2 * t_y / displayHeight;
	
	glUniformMatrix4fv(mvpLoc, 1, GL_FALSE, (const float *)&mvpMat);
	
	// texMatrix
	GLuint tmLoc = glGetUniformLocation(program, "texMatrix");
	CMatrix4 tmMat;
	glUniformMatrix4fv(tmLoc, 1, GL_FALSE, (const float *)&tmMat);
	
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
}

/**
 *	矩形オブジェクトを使って描画領域とテクスチャの描画範囲を指定し描画する関数
 *	矩形の座標は左上が基準
 */
void CSprite::DrawRect(CTexture *texture, const CRectangle &srcRect, const CRectangle &destRect) {
	if(!texture || !shader_program) return;
	
	// シェーダーのプログラムID取得
	GLuint program = shader_program;
	/**
	 *	シェーダーの設定
	 */
	glUseProgram(program);
	
	/**
	 *	Atrribute変数の設定
	 */
	// position
	GLuint posLoc = glGetAttribLocation(program, "position");
	glEnableVertexAttribArray(posLoc);
	glVertexAttribPointer(posLoc, 3, GL_FLOAT, GL_FALSE, sizeof(float)*3, points);
	// texcoord
	GLuint texCoordLoc = glGetAttribLocation(program, "texcoord");
	glEnableVertexAttribArray(texCoordLoc);
	glVertexAttribPointer(texCoordLoc, 2, GL_FLOAT, GL_FALSE, sizeof(float)*2, tex_coords);
	
	/**
	 *	Uniform変数の設定
	 */
	// monoColor
	//	float color[] = {1,1,1,1};
	GLuint colorLoc = glGetUniformLocation(program, "monoColor");
	glUniform4fv(colorLoc, 1, (const float *)&color);
	
	// sampler
	GLuint texLoc = glGetUniformLocation(program, "sampler");
	glUniform1i(texLoc, 0);		// テクスチャユニットを0に設定
	
	// テクスチャの設定
	glActiveTexture(GL_TEXTURE0);
	glBindTexture(GL_TEXTURE_2D, texture->GetID());
	
	// modelViewProjectionMatrix
	// 行列変換
	GLuint mvpLoc = glGetUniformLocation(program, "modelViewProjectionMatrix");
//	CMatrix4 mvpMat = CMatrix4::Translation(CVector(1, -1, 0));
	CMatrix4 mvpMat;
	mvpMat *= CMatrix4::Scale(CVector(destRect.GetWidth()/2.0f, destRect.GetHeight()/2.0f, 1));
//	mvpMat *= CMatrix4::Rotation(CQuaternion(rad/(2*GL_PI), CVector(0, 0, 1)));
	mvpMat *= CMatrix4::Translation(CVector(-displayWidth/2.0f+destRect.GetX(), displayHeight/2.0f-destRect.GetY(), 0));
	mvpMat *= CMatrix4::LookAt(CVector(0, 0, 10), CVector(), CVector(0, 1, 0));
	mvpMat *= CMatrix4::Orthof(-displayWidth/2.0f, displayWidth/2.0f, displayHeight/2.0f, -displayHeight/2.0f, 1, 100);
	
	
	glUniformMatrix4fv(mvpLoc, 1, GL_FALSE, (const float *)&mvpMat);
	
	// texMatrix
	GLuint tmLoc = glGetUniformLocation(program, "texMatrix");
	CMatrix4 tmMat = CMatrix4::Scale(CVector(srcRect.GetWidth()/texture->GetWidth(), srcRect.GetHeight()/texture->GetHeight(), 1));
	tmMat *= CMatrix4::Translation(CVector(srcRect.GetX()/texture->GetWidth(), srcRect.GetHeight()/texture->GetHeight(), 0));
	glUniformMatrix4fv(tmLoc, 1, GL_FALSE, (const float *)&tmMat);
	
	/**
	 *	描画
	 */
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	
	// テクスチャの解除
	glBindTexture(GL_TEXTURE_2D, 0);
	
	/**
	 *	シェーダーの解除
	 */
	glUseProgram(0);
}
