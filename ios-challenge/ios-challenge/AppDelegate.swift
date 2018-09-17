//
//  AppDelegate.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 14/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //create and assign root viewController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = FavoritesViewController()
        DispatchQueue.main.async {
            self.window?.rootViewController?.viewDidLoad()
        }
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }


}

