//
//  CubeModel.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/01.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef CUBE_MODEL_H_
#define CUBE_MODEL_H_

#include "AbstractModel.h"
#include "Math.h"
#include "Color.h"

class CubeModel : public AbstractModel {
public:
    virtual void Render(const Game3DObject *);
};

#endif /* defined(__KandataGame__CubeModel__) */
