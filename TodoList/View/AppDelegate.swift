//
//  AppDelegate.swift
//  TodoList
//
//  Created by milli on 2023/02/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
        
        return true
    }
}

