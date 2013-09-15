//
//  GameController.m
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/15.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#import "GameController.h"
#import "GameView.h"
#import <QuartzCore/QuartzCore.h>

#include "KandataGame.h"
#include "InputManager.h"

@interface GameController ()
{
    id mpDisplayLink;
    KandataGame *pMainGame;
}
@end

@implementation GameController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // マルチタッチを有効にする方法
    self.view.multipleTouchEnabled = YES;
    
    // トップのステータスバーを消去する方法
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // ディスプレイリンクの設定 --> mainLoop
	mpDisplayLink = [[UIScreen mainScreen] displayLinkWithTarget:self selector:@selector(mainLoop)];
	[mpDisplayLink addToRunLoop:[ NSRunLoop currentRunLoop ] forMode:NSDefaultRunLoopMode ];
    
    GameView *gameView = (GameView *)self.view;
    
    // ゲームの初期化
//    NSLog(@"size: %d, %d", gameView.Width, gameView.Height);
	pMainGame = new KandataGame(gameView.Width, gameView.Height);
    pMainGame->Initialize();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    // ゲームの後処理
    pMainGame->Finalize();
    if(pMainGame) delete pMainGame;
}

- (void) mainLoop
{
    // 更新
    if(pMainGame) pMainGame->Update();
    
    // 描画
    GameView *gameView = (GameView *)self.view;
    [gameView beginScene];
    if(pMainGame) pMainGame->Draw();
    [gameView endScene];
}

/**=================================================================================
*   イベントハンドラ
*   タッチされた瞬間に呼び出されるメソッド（コールバック）
* =================================================================================*/
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(pMainGame) {
        // InputManagerのポインタを取得
        InputManager *pInput = pMainGame->GetGame()->GetInputMgr();
        
        // タッチデータ（マップ）の取得
        TouchesMap *touches_map = pInput->GetTouches();
        
        for (UITouch *touch in touches) {
            // touchデータのマップへの登録
            (*touches_map)[touch] = new TouchData(touch);
        }
        
        for (UITouch *touch in touches) pInput->ForwardTouchEvent(TouchData(touch));
    }
}

/**=================================================================================
*   イベントハンドラ
*   タッチしている間に呼び出されるメソッド（コールバック）
* =================================================================================*/
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(pMainGame) {
        InputManager *pInput = pMainGame->GetGame()->GetInputMgr();
        
        for (UITouch *touch in touches) {
            pInput->ForwardTouchEvent(TouchData(touch));
        }
    }
}

/**=================================================================================
*   イベントハンドラ
*   タッチから離された瞬間に呼び出されるメソッド（コールバック）
* =================================================================================*/
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"Touch ended");
    if(pMainGame) {
        InputManager *pInput = pMainGame->GetGame()->GetInputMgr();
        // タッチデータ（マップ）の取得
        TouchesMap *touches_map = pInput->GetTouches();
        
        for (UITouch *touch in touches) pInput->ForwardTouchEvent(TouchData(touch));
        
        for (UITouch *touch in touches) {
            TouchesMap::iterator it = touches_map->find(touch);
            if(it != touches_map->end()) {
                delete it->second;
                touches_map->erase(it);
            }
        }
    }
}

/**=================================================================================
 *   イベントハンドラ
 *   外部のシステムから割り込まれる際に呼び出されるメソッド（コールバック）
 * =================================================================================*/
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(pMainGame) {
        InputManager *pInput = pMainGame->GetGame()->GetInputMgr();
        TouchesMap *touches_map = pInput->GetTouches();
        
        for (UITouch *touch in touches) pInput->ForwardTouchEvent(TouchData(touch));
        
        for (UITouch *touch in touches) {
            TouchesMap::iterator it = touches_map->find(touch);
            if(it != touches_map->end()) {
                delete it->second;
                touches_map->erase(it);
            }
        }
    }
}

@end
