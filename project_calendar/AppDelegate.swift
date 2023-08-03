//
//  AppDelegate.swift
//  project_calendar
//
//  Created by zhangjianming on 2023/8/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
//        if #available(iOS 13.0, *) {
//            window?.overrideUserInterfaceStyle = CLTheme.mode.style
//        }
        
//        let controller = CLPopupCalendarController()
//        let navctrl = CLNavigationController(rootViewController: controller)

        let navctrl = CLNavigationController()
        window?.rootViewController = navctrl
        window?.makeKeyAndVisible()
        
        
        let controller = CLPopupCalendarController()
        controller.show()
//        let tabBarController = CLTabBarController()
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .all
    }
}


