//
//  ViewController.swift
//  SwiftCodable
//
//  Created by Dimasno1 on 6/8/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class SceneController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        view.addSubview(redDot)
        view.addSubview(playButton)
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewWillLayoutSubviews() {
        redDot.center = view.center
        playButton.center.x = view.center.x
        playButton.center.y = view.frame.maxY - 20
    }
    
    @objc private func play() {
        redDot.setNeedsLayout()
        redDot.layoutIfNeeded()
        mementoRecorder.play()
    }
    
    @objc private func moveDot(sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: view)
            
            DispatchQueue.main.async {
                self.redDot.center.x += translation.x
                self.redDot.center.y += translation.y
            }
            mementoRecorder.record()
            let memento = DotMemento(x: redDot.center.x, y: redDot.center.y)
            redDot.setDotMemento(memento)
            sender.setTranslation(CGPoint.zero, in: view)
        default:
            break
        }
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        let dotSize = CGSize(width: 30, height: 30)
        redDot = RedDotView(frame: CGRect(origin: CGPoint.zero, size: dotSize))
        
        playButton.setTitle("Replay", for: .normal)
        playButton.sizeToFit()
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
        
        mementoRecorder = DotMementoRecorder(dot: redDot)
        gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(moveDot(sender:)))
    }
    
    private var redDot = RedDotView()
    private var mementoRecorder: DotMementoRecorder!
    private var gestureRecognizer = UIPanGestureRecognizer()
    private let playButton = UIButton(type: UIButtonType.system)
}

