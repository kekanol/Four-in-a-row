//
//  AppDelegate.swift
//  Four in a row
//
//  Created by Константин on 22.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = ViewController()

        let window = UIWindow()
        window.rootViewController = vc
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }


}

