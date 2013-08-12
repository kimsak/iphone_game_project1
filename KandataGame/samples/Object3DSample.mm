//
//  Object3DSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Object3DSample.h"
#include "CubeModel.h"

bool Sample3DObj::Init() {
    SetValue(MODEL_PROPERTY, new CubeModel);
    return true;
}

bool Sample3DObj::Move() {
    rotation *= CQuaternion(0.02f, AXIS_X);
    return true;
}

bool Sample3DObj::Draw() {
    AbstractModel *pModel = (AbstractModel *)GetValue(MODEL_PROPERTY);
    if (pModel) pModel->Render(this);
    
    return true;
}

Sample3DObj::~Sample3DObj() {
    AbstractModel *pModel = (AbstractModel *)GetValue(MODEL_PROPERTY);
    if(pModel) delete pModel;
}
