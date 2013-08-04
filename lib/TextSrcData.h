//
//  TextSrcData.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/04.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef TEXT_SRC_DATA_H_
#define TEXT_SRC_DATA_H_

class TextSrcData {
    /**
     *  テキストデータを格納する文字列メンバ変数（ポインタ）
     *  ファイルなどからソースを読み込む際、動的にnewするので、オブジェクトが破棄される際は
     *  自動的にdeleteするようにする。
     */
    char *pSrcChars;
public:
    // コンストラクタ
    TextSrcData() : pSrcChars(NULL) {}
    
    // デストラクタ
    ~TextSrcData() {
        if(pSrcChars) delete[] pSrcChars;
    }
    
    char *GetCString() const {
        return pSrcChars;
    }
    
    bool LoadContentFromFile(const char *filename, const char *extension_name);
};

#endif
