//
//  src_loader_objc.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/06/23.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//
#import <UIKit/UIKit.h>

#include "source_loader.h"

bool LoadSourceData(
        const char *vertex_name,
        const char *fragment_name,
        const char **pp_vSrcData,
        const char **pp_fSrcData
) {
    // const char *からNSString *に変換
    NSString
    *ns_vertexName
            = [NSString stringWithCString:vertex_name encoding:NSUTF8StringEncoding],
    *ns_fragmentName
            = [NSString stringWithCString:fragment_name encoding:NSUTF8StringEncoding];
    
    // ファイルパスからファイルパスを取得する
    NSString
        *ns_vertexPath = [[NSBundle mainBundle] pathForResource:ns_vertexName ofType:@"vsh"],
        *ns_fragmentPath = [[NSBundle mainBundle] pathForResource:ns_fragmentName ofType:@"fsh"];
    
    // パスが取得できない場合はfalseで返す。
    if(ns_vertexPath == nil || ns_fragmentPath==nil) return false;
    
    // ファイルパスからソースデータを取得する
    NSString *ns_vSrcData = [NSString stringWithContentsOfFile:ns_vertexPath encoding:NSUTF8StringEncoding error:nil],
    *ns_fSrcData = [NSString stringWithContentsOfFile:ns_fragmentPath encoding:NSUTF8StringEncoding error:nil];
    
    // char型に直して出力用引数に格納
    *pp_vSrcData = [ns_vSrcData UTF8String];
    *pp_fSrcData = [ns_fSrcData UTF8String];
    
    return true;
}