//
//  AppDelegate.swift
//  StretchyLayouts
//
//  Created by Simeon on 26/10/17.
//  Copyright © 2017 Enabled. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = StretchyViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

