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
        animate(with: 10.0)
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
    
    private func animate(with duration: Double) {
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .allowUserInteraction, animations: {
            
            let fps = Double(self.mementos.count) / duration
            let oneFrameDuration = 1 / fps
            
            UIView.performWithoutAnimation {
                self.dot.center = CGPoint(x: self.mementos[1].x, y: self.mementos[1].y)
            }
            for x in 1...self.mementos.count - 1 {
                let dotCenter = CGPoint(x: self.mementos[x].x, y: self.mementos[x].y)
                UIView.addKeyframe(withRelativeStartTime: (Double(x) * oneFrameDuration) / duration,
                                   relativeDuration: oneFrameDuration,
                                   animations: { self.dot.center = dotCenter })
            }
        }, completion: { _ in
            print("Done")
        })
    }
    
    private var dot: RedDotView
    private var mementos = [DotMemento]()
    private var mementoIndex: Int = 0
}
