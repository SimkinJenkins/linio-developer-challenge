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

    let json = """
[
  {
    "id": 408483,
    "name": "Mi lista de favoritos",
    "description": "Mi lista de favoritos",
    "default": false,
    "owner": {
      "name": "Doctor Evil",
      "email": "customer-53284@linio.com",
      "linioId": "52xcfee"
    },
    "createdAt": "2016-06-10T23:04:23+0000",
    "visibility": "public",
    "products": {
      "OM485HB98ZURLMX": {
        "id": 2286984,
        "name": "Báscula Digital Omron HN 289 - Aqua",
        "wishListPrice": 399,
        "slug": "ba-scula-digital-omron-hn-289-aqua-x2pl84",
        "url": "/mapi/v1/p/ba-scula-digital-omron-hn-289-aqua-x2pl84",
        "image": "https://i.linio.com/p/c97a50b1c6c7e3bb2c48c1b4104d5975-product.jpg",
        "linioPlusLevel": 1,
        "conditionType": "refurbished",
        "freeShipping": false,
        "imported": false,
        "active": true
      },
      "PH145HB1GKBF2LMX": {
        "id": 2317863,
        "name": "Secadora Cabello Philips HP8232/01 Iones Thermo Protect",
        "wishListPrice": 899,
        "slug": "secadora-cabello-philips-hp8232-01-iones-thermo-protect-lcvnkj",
        "url": "/mapi/v1/p/secadora-cabello-philips-hp8232-01-iones-thermo-protect-lcvnkj",
        "image": "https://i.linio.com/p/f1a6240aad2fca51f065da7a39f4f37d-product.jpg",
        "linioPlusLevel": 1,
        "conditionType": "refurbished",
        "freeShipping": false,
        "imported": false,
        "active": true
      },
      "WE183HL0AMMVALMX": {
        "id": 2287001,
        "name": "Bote De Basura Con Pedal  3 Lt",
        "wishListPrice": 269,
        "slug": "bote-de-basura-con-pedal-3-lt-wydxt2",
        "url": "/mapi/v1/p/bote-de-basura-con-pedal-3-lt-wydxt2",
        "image": "https://i.linio.com/p/8c59451780d21c17cc4ec3c6de0df79c-product.jpg",
        "linioPlusLevel": 0,
        "conditionType": "new",
        "freeShipping": false,
        "imported": true,
        "active": true
      }
    }
  },
  {
    "id": 427057,
    "name": "Séneca 148",
    "description": "Séneca 148",
    "default": false,
    "owner": {
      "name": "Angela Ursic Bedoya",
      "email": "angela.ursic@linio.com",
      "linioId": "qe54zj"
    },
    "createdAt": "2016-07-23T03:41:29+0000",
    "visibility": "private",
    "accessHash": "",
    "products": {
      "QU886HL0HYESMLMX": {
        "id": 2287014,
        "name": "Molde Rosca Clásica De Metal Queen Sense",
        "wishListPrice": 289,
        "slug": "molde-rosca-cla-sica-de-metal-queen-sense-trbphh",
        "url": "/mapi/v1/p/molde-rosca-cla-sica-de-metal-queen-sense-trbphh",
        "image": "https://i.linio.com/p/2a19511bb5fa692c880fcbee6141883f-product.jpg",
        "linioPlusLevel": 0,
        "conditionType": "new",
        "freeShipping": false,
        "imported": true,
        "active": true
      },
      "RE244HB0KUT3SLMX": {
        "id": 2399871,
        "name": "Secadora de Cabello Fast Finish dobre Turbina REMINGTON D3710 - Rojo con Accesorios",
        "wishListPrice": 499,
        "slug": "secadora-de-cabello-fast-finish-dobre-turbina-remington-d3710-rojo-con-accesorios-toitjt",
        "url": "/mapi/v1/p/secadora-de-cabello-fast-finish-dobre-turbina-remington-d3710-rojo-con-accesorios-toitjt",
        "image": "https://i.linio.com/p/c62c8575d8e16e21a45d27de7d4ed7cb-product.jpg",
        "linioPlusLevel": 1,
        "conditionType": "new",
        "freeShipping": false,
        "imported": false,
        "active": true
      },
      "OS100HB0QE16SLMX": {
        "id": 2317862,
        "name": "Secadora de Cabello Profesional Modelo HCSTHD1400",
        "wishListPrice": 599,
        "slug": "secadora-de-cabello-profesional-modelo-hcsthd1400-s1howb",
        "url": "/mapi/v1/p/secadora-de-cabello-profesional-modelo-hcsthd1400-s1howb",
        "image": "https://i.linio.com/p/96eb4554661f1b61d1f4458dd234808d-product.jpg",
        "linioPlusLevel": 2,
        "conditionType": "new",
        "freeShipping": false,
        "imported": false,
        "active": true
      }
    }
  }
]
""" // our data in native (JSON) format

}

