//
//  FavoritesViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

// Contains Favorites UICollectionView info
struct FavoritesViewModel {

    static let favoritesSectionTitle = "Favoritos"
    static let allProductsSectionTitle = "Todos mis favoritos"

    public var sections: [CollectionViewSection]!
    public var url: URL!

    init(url: URL) {

        self.url = url
    }

    init(sections: [CollectionViewSection]) {

        self.sections = sections
    }

}
