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
        let tabBarController = UITabBarController()
        let habitsNavigationController = UINavigationController(rootViewController: HabitsViewController())
        let infoNavigationController = UINavigationController(rootViewController: InfoViewController())
        habitsNavigationController.tabBarItem.title = "Привычки"
        habitsNavigationController.tabBarItem.image = UIImage(systemName: "rectangle.split.1x2.fill")
        infoNavigationController.tabBarItem.title = "Информация"
        infoNavigationController.tabBarItem.image = UIImage(systemName: "info.circle.fill")
        
        tabBarController.viewControllers = [habitsNavigationController, infoNavigationController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }


}

