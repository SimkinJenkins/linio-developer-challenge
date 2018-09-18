//
//  ProductsCollectionCellViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

class ProductsCollectionViewModel: NSObject {

    var model: ProductsCollectionModel!

    convenience init(model: ProductsCollectionModel) {
        self.init()

        self.model = model
    }
}
