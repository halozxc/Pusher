//
//  AppDelegate.swift
//  Pusher
//
//  Created by 奚锐的Mac on 2020/6/10.
//  Copyright © 2020 奚锐的Mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



   //申请授权
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

            guard #available(iOS 10, *) else {
                // 请求授权
                let typeValue = UIUserNotificationType.alert.rawValue |
                    UIUserNotificationType.badge.rawValue |
                    UIUserNotificationType.sound.rawValue
                let type = UIUserNotificationType(rawValue: typeValue)
                let setting = UIUserNotificationSettings(types: type, categories: nil)
                UIApplication.shared.registerUserNotificationSettings(setting)
                
                // 发送请求
                UIApplication.shared.registerForRemoteNotifications()
                return true
            }
            let typeValue = UNAuthorizationOptions.alert.rawValue |
                UNAuthorizationOptions.badge.rawValue |
                UNAuthorizationOptions.sound.rawValue
            UNUserNotificationCenter.current().requestAuthorization(options: UNAuthorizationOptions(rawValue: typeValue)) { (granted, error) in
                if granted { // 同意
                   print("accepted")
                } else { // 拒绝
                    /// 弹出提示框
                    print("denied")
                }
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

