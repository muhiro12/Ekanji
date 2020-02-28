//
//  AppDelegate.swift
//  Yomeru
//
//  Created by Hiromu Nakano on 2020/01/17.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import UIKit
import Hero

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.tintColor = .systemTeal
        return true
    }

}
