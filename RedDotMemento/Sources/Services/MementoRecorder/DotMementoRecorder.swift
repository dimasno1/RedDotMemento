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
        animate()
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
    
    private func animate() {
        UIView.animateKeyframes(withDuration: 10, delay: 0, options: .calculationModeCubic, animations: {
            var counter = 0
            
            UIView.performWithoutAnimation {
                self.dot.center = CGPoint(x: self.mementos[1].x, y: self.mementos[1].y)
            }
            for memento in self.mementos.dropFirst() {
                let dotCenter = CGPoint(x: memento.x, y: memento.y)
                
                UIView.addKeyframe(withRelativeStartTime: (Double(counter) / Double(self.mementos.count)) / 10, relativeDuration: (1 / Double(self.mementos.count)) / 10, animations: {
                    self.dot.center = dotCenter
                })
                counter += 1
            }
        }, completion: nil)
    }
    
    private var dot: RedDotView
    private var mementos = [DotMemento]()
    private var mementoIndex: Int = 0
}
