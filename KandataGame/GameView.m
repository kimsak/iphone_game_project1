//
//  GameView.m
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/15.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#import "GameView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GameView

@synthesize Width;
@synthesize Height;

/**
 *  レイヤーのセット
 */
+ (Class)layerClass
{
    return [CAEAGLLayer class];
}

/**
 *	ビューの初期化処理
 */
- (id)initWithCoder:(NSCoder *)aDecoder
{
    // インスタンス変数の初期化
    context = nil;
    frame_buffer = render_buffer = depth_buffer = 0;
    
    self = [super initWithCoder:aDecoder];
    
    if(self) {
        // レイヤの取得
        CAEAGLLayer *layer = (CAEAGLLayer *)self.layer;
        
        /**
         *  ディスプレイサイズの取得
         */
        // Retina対応
        float scale = [UIScreen mainScreen].scale;
		self.contentScaleFactor = scale;
		layer.contentsScale = scale;
		
		CGRect frame = [UIScreen mainScreen].bounds;
		frame.origin = CGPointZero;

        layer.frame = frame;
        
        layer.opaque = YES;
		layer.drawableProperties =
        [NSDictionary dictionaryWithObjectsAndKeys:
         [NSNumber numberWithBool:NO], kEAGLDrawablePropertyRetainedBacking,
         kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat,
         nil];
        
        // 幅、高さの設定
        self.Width = frame.size.width * scale;
        self.Height = frame.size.height * scale;
        
        [self setupGL:layer];
    }
    
    return self;
}

/**
 *  OpenGLの設定
 */
- (void) setupGL:(CAEAGLLayer *)layer
{
    // Contextの作成
    context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    //===============================================
    // フレームバッファの生成
    glGenFramebuffers(1, &frame_buffer);
    glBindFramebuffer(GL_FRAMEBUFFER, frame_buffer);
    
    //===============================================
    // レンダーバッファの生成
    glGenRenderbuffers(1, &render_buffer);
    glBindRenderbuffer(GL_RENDERBUFFER, render_buffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, render_buffer);
    [context renderbufferStorage:GL_RENDERBUFFER fromDrawable:layer];
    
    //===============================================
    // 深度バッファの生成
    {
        int bWidth = 0, bHeight = 0;
        glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &bWidth);
        glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &bHeight);
        glGenRenderbuffers(1, &depth_buffer);
        glBindRenderbuffer(GL_RENDERBUFFER, depth_buffer);
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, bWidth, bHeight);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depth_buffer);
    }
    
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
	glBindRenderbuffer(GL_RENDERBUFFER, 0);
}

- (void) beginScene
{
    [EAGLContext setCurrentContext:context];
	glBindFramebuffer(GL_FRAMEBUFFER, frame_buffer);
}

- (void) endScene
{
    glBindRenderbuffer(GL_RENDERBUFFER, render_buffer);
	// 画面上( ビューの持つレイヤ )にレンダバッファのコンテンツを表示する
	[context presentRenderbuffer:GL_RENDERBUFFER];
}

@end
