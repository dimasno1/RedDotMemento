//
//  TestMementoView.swift
//  SwiftCodable
//
//  Created by Dimasno1 on 6/8/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class RedDotView: UIView {
    
    var isPlaying: Bool = false
    
    var memento: DotMemento
    
    func getMemento() -> DotMemento {
        return memento
    }
    
    func setDotMemento(_ memento: DotMemento) {
        self.memento = memento
    }
    
    override init(frame: CGRect) {
        memento = DotMemento(x: 0, y: 0)
        super.init(frame: frame)
        backgroundColor = .red
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error: init with a decoder not implemented, use init(frame: CGRect)")
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = frame.size.width / 2
    }
}
