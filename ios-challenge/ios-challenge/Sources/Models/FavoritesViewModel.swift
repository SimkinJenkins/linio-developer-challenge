//
//  FavoritesViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

struct FavoritesViewModel {

    var sections: [CollectionViewSection]!
}

struct CollectionViewSection {

    var header: HeaderReusableView!
    var cells: [ProductsCollectionViewModel]!

}
