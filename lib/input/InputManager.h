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
#include "InputMotion.h"

typedef ConstTouchPtr TouchKey;

typedef std::map<TouchKey, TouchData *> TouchesMap;
typedef TouchesMap *TouchesMapPtr;

class InputManager {
    //////////////////////////// Touch Data List ///////////////////////////////////////
    
    // TouchData Map
    TouchesMap touch_map;
    
    // TouchListener List
    std::list<ITouchListener *> touchlistener_list;
    
    // InputMotionデータ
    InputMotion motion;
    
public:
    
    // タッチのマップデータ（参照）を取得する
    TouchesMap *GetTouches() {
        return &touch_map;
    }
    
    const TouchData *GetTouchData(TouchKey pTouch) {
        auto it = touch_map.find(pTouch);
        return it != touch_map.end() ? it->second : NULL;
    }
    
    // モーション管理データの参照を取得する
    InputMotion *GetMotion() {
        return &motion;
    }
    
    ////////////////////////////// TouchListener //////////////////////////////////////////
    
    // タッチリスナーを追加する
    void AddTouchListener(ITouchListener *listener) {
        if(listener) touchlistener_list.push_back(listener);
    }
    
    // タッチリスナーをリストから削除する（リスナーを実装したオブジェクトが破棄される場合）
    void RemoveTouchListener(ITouchListener *listener) {
        if(listener)
            for(auto it = touchlistener_list.begin(); it != touchlistener_list.end(); ) {
                if(*it == listener) {
                    touchlistener_list.erase(it);
                    break;
                }
                ++it;
            }
    }
    
    // リスナーを実装した各オブジェクトにタッチ情報を転送する
    void ForwardTouchEvent(const TouchData &touch) {
        for (auto it = touchlistener_list.begin();
                                    it != touchlistener_list.end(); ++it) {
            (*it)->OnTouchAction(touch);
        }
    }
};

#endif  /*INPUT_MANAGER_H_*/
