//
//  InputManager.h
//  KandataGame
//
//  Created by 木村 裕作 on 2013/09/01.
//  Copyright (c) 2013年 木村 裕作. All rights reserved.
//

#ifndef INPUT_MANAGER_H_
#define INPUT_MANAGER_H_
#include <map>
#include <list>
#include "TouchData.h"
#include "ITouchListener.h"

typedef std::map<TouchPointer, TouchData *> TouchesMap;

class InputManager {
    // TouchData Map
    TouchesMap touch_list;
    
    // TouchListener List
    std::list<ITouchListener *> touchlistener_list;
    
public:
    
    // タッチのマップデータ（参照）を取得する
    TouchesMap *GetTouches() {
        return &touch_list;
    }
    
    // タッチリスナーを追加する
    void AddTouchListener(ITouchListener *listener) {
        if(listener) touchlistener_list.push_back(listener);
    }
    
    void RemoveTouchListener(ITouchListener *listener) {
        if(listener)
            for(std::list<ITouchListener *>::iterator it = touchlistener_list.begin();
                                    it != touchlistener_list.end(); ) {
                if(*it == listener) {
                    touchlistener_list.erase(it);
                    break;
                }
                ++it;
            }
    }
    
    void ForwardTouchEvent(const TouchData &touch) {
        for (std::list<ITouchListener *>::const_iterator it = touchlistener_list.begin();
                                    it != touchlistener_list.end(); ++it) {
            (*it)->OnTouchAction(touch);
        }
    }
};

#endif  /*INPUT_MANAGER_H_*/
