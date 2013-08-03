//
//  Object3DSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Object3DSample.h"

void Sample3DObj::Init(GameObjList *pObjList) {
    
}

void Sample3DObj::Move(GameObjList *pObjList) {
    rotation *= CQuaternion(0.01f, AXIS_X);
}


