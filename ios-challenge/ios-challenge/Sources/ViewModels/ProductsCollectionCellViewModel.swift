//
//  ProductsCollectionCellViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ProductsCollectionCellViewModel: CellViewModelProtocol {

    // it can be used to conform a Protocol for implement dynamic SupplementaryViews creation
    static var reuseId = "ProductsCollectionViewCell"

    var reuseId: String {
        return ProductsCollectionCellViewModel.reuseId
    }

    public var numberOfProducts: Int {
        return model.products.count
    }

    private var model: ProductsCollection!

    convenience init(model: ProductsCollection) {
        self.init()

        self.model = model
    }

    public func getProduct(at index: Int) -> Product? {

        return Array(model.products)[index].value
    }

}
