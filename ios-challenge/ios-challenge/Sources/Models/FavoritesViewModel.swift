//
//  FavoritesViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

struct FavoritesViewModel {

    static let favoritesSectionTitle = "Favoritos"
    static let allProductsSectionTitle = "Todos mis favoritos"

    var sections: [CollectionViewSection]!

    init(sections: [CollectionViewSection]) {

        self.sections = sections
    }

}

struct CollectionViewSection {

    var headerTitle: String!
    var cells: [CellViewModelProtocol]!

    var headerFont: UIFont = .sectionHeaderTitle
}
