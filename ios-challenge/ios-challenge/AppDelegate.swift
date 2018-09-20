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

    var userCollections: [ProductsCollection]!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        //create and assign root viewController
        window = UIWindow(frame: UIScreen.main.bounds)

        let url = "https://gist.githubusercontent.com/egteja/98ad43f47d40b0868d8a954385b5f83a/raw/5c00958f81f81d6ba0bb1b1469c905270e8cdfed/wishlist.json"
        let favoritesModel = FavoritesViewModel(url: URL(string: url)!)
        let favoritesViewModel = FavoritesViewViewModel(model: favoritesModel)
        let favoritesView = FavoritesViewController(viewModel: favoritesViewModel)
        window?.rootViewController = favoritesView
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

