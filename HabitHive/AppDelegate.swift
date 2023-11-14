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
        let habitsNavigationViewController = UINavigationController(rootViewController: HabitsViewController())
        let infoViewController = InfoViewController()
        habitsNavigationViewController.tabBarItem.title = "Привычки"
        habitsNavigationViewController.tabBarItem.image = UIImage(systemName: "rectangle.split.1x2.fill")
        infoViewController.tabBarItem.title = "Информация"
        infoViewController.tabBarItem.image = UIImage(systemName: "info.circle.fill")
        
        tabBarController.viewControllers = [habitsNavigationViewController, infoViewController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }


}

