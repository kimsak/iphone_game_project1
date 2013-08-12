//
//  AbstractObject.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/12.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef ABSTRACT_OBJECT_H_
#define ABSTRACT_OBJECT_H_
#include <string>

class AbstractObject {
    std::string name;
public:
    // デストラクタ
    virtual ~AbstractObject() {}
    
    virtual void Init() = 0;
    virtual bool Move() = 0;
    virtual bool Draw() = 0;
    
    void SetName(std::string name) {
        this->name = name;
    }
    
    std::string GetName() const {
        return name;
    }
};

#endif
