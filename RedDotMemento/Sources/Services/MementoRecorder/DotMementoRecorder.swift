//
//  ViewRecorder.swift
//  SwiftCodable
//
//  Created by Dimasno1 on 6/8/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class DotMementoRecorder {
    
    init(dot: RedDotView) {
        self.dot = dot
    }
    
    func play() {
        dot.isPlaying = true
        for memento in mementos.dropFirst() {
            dot.setDotMemento(memento)
        }
        dot.isPlaying = false
    }
    
    func rewind() {
        if mementoIndex > 0 {
            mementoIndex -= 1
            dot.memento = mementos[mementoIndex]
        }
    }
    
    func record() {
        mementos.append(dot.getMemento())
    }
    
    func reset() {
        mementos.removeAll()
    }
    
    func stop() {
        mementoIndex = mementos.endIndex
    }
    
    private var dot: RedDotView
    private var mementos = [DotMemento]()
    private var mementoIndex: Int = 0
}
