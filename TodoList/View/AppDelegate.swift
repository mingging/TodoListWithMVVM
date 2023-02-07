//
//  AppDelegate.swift
//  TodoList
//
//  Created by milli on 2023/02/06.
//

import UIKit

import SnapKit
import Then

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let window = UIWindow()
    let viewController = ViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        
        return true
    }
}

