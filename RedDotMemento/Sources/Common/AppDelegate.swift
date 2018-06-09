//
//  AppDelegate.swift
//  SwiftCodable
//
//  Created by Dimasno1 on 6/8/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let rootController = SceneController()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

