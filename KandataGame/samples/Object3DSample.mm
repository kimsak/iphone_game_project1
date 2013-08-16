//
//  Object3DSample.mm
//  KandataGame
//
//  Created by 木村 裕作 on 2013/08/03.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#include "Object3DSample.h"
#include "CubeModel.h"

void Sample3DObj::Init() {
    SetValue(MODEL_PROPERTY, new CubeModel);
}

void Sample3DObj::Move() {
    rotation *= CQuaternion(0.02f, AXIS_X);
}

void Sample3DObj::Draw() {
    AbstractModel *pModel = (AbstractModel *)GetValue(MODEL_PROPERTY);
    if (pModel) pModel->Render(this);
    
}

Sample3DObj::~Sample3DObj() {
    AbstractModel *pModel = (AbstractModel *)GetValue(MODEL_PROPERTY);
    if(pModel) delete pModel;
}
