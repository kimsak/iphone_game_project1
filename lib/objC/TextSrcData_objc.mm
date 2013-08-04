//
//  TextSrcData_objc.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/04.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include <cstring>
#include "TextSrcData.h"

bool TextSrcData::LoadContentFromFile(const char *filename, const char *extension_name) {
    if(!filename || !extension_name) return false;
    
    // それぞれの文字列をNSStringの形式に変換
    NSString
        *ns_filename = [NSString stringWithCString:filename encoding:NSUTF8StringEncoding],
        *ns_extension_name = [NSString stringWithCString:extension_name encoding:NSUTF8StringEncoding];
    
    // ファイルパスの抽出(取得できなかったときはfalseで返す)
    NSString *ns_filepath = [[NSBundle mainBundle] pathForResource:ns_filename ofType:ns_extension_name];
    if(ns_filepath == nil) return false;
    
    // テキストデータの抽出
    NSString *ns_src_data = [NSString stringWithContentsOfFile:ns_filepath encoding:NSUTF8StringEncoding error:nil];
    
    // 中身のデータをchar *で取得
    const char *src_data = [ns_src_data UTF8String];
    // 文字列の長さを取得
    uint src_data_length = strlen(src_data);
    
    /**
     *  ソースデータのコピー
     */
    // メモリ確保
    pSrcChars = new char[src_data_length + 1];
    // コピー
    strncpy(pSrcChars, src_data, src_data_length+1);
    
    return true;
}
