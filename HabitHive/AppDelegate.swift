//
//  AppDelegate.swift
//  HabitHive
//
//  Created by Мария Нестерова on 12.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }


}

