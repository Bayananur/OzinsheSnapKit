//
//  AppDelegate.swift
//  ozinsheSnapKit
//
//  Created by Bauyrzhan Seidazymov on 21.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // let navigationController = UINavigationController(rootViewController: OnboardingViewController())
       // navigationController.navigationBar.isHidden = true // скрыть навигационную панель, если она не нужна
       // window?.rootViewController = OnboardingViewController()
       // window?.makeKeyAndVisible()
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
//        navigationBar.tintColor = UIColor(named: "backButtonColor")
        UINavigationBar.appearance().tintColor = UIColor(named: "black")
        
        if let navigationController = window?.rootViewController as? UINavigationController,
           let backButton = navigationController.navigationBar.backItem?.backBarButtonItem {
            backButton.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 24, vertical: 0), for: .default)
        }
     return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

