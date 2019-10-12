//
//  AppDelegate.swift
//  ManualLayout
//
//  Created by Dan Vybiral on 09/10/2019.
//  Copyright © 2019 Kiwi.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let mainViewController = ViewController()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()

        return true
    }
}

