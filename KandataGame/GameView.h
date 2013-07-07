//
//  GameView.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/15.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameView : UIView
{
    // OpenGL用コンテキスト
    EAGLContext *context;
    
    // フレームバッファオブジェクト
    GLuint frame_buffer;
    
    // レンダーバッファオブジェクト
    GLuint render_buffer;
    
    // 深度バッファオブジェクト
    GLuint depth_buffer;
}
@property int Width;
@property int Height;

/**
 *  描画開始メソッド
 */
- (void) beginScene;

/**
 *  描画終了
 */
- (void) endScene;

@end
