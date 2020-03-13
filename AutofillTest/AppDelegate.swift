//
//  AppDelegate.swift
//  AutofillTest
//
//  Created by Michael Gray on 3/13/20.
//  Copyright © 2020 Michael Gray. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        let vc = ViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        return true
    }

}

