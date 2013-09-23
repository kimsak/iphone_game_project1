//
//  ITouchListener.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/07.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef I_TOUCH_LISTENER_H_
#define I_TOUCH_LISTENER_H_

class TouchData;

/**
 *  Interface
 */
class ITouchListener {
public:
    // 仮想デストラクタ
    virtual ~ITouchListener() {}
    
    virtual void OnTouchAction(const TouchData &touch) = 0;
};

#endif  /* I_TOUCH_LISTENER_H_ */
