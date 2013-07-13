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
    pMainGame->Update();
    
    // 描画
    GameView *gameView = (GameView *)self.view;
    [gameView beginScene];
    pMainGame->Draw();
    [gameView endScene];
}

@end
