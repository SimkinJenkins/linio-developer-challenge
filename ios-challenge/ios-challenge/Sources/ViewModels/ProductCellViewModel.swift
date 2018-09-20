//
//  ProductViewCellViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ProductViewCellViewModel: CellViewModelProtocol {

    // it can be used to conform a Protocol for implement dynamic SupplementaryViews creation
    static var reuseId = "ProductViewCell"

    var reuseId: String {
        return ProductViewCellViewModel.reuseId
    }

    var model: Product!

    convenience init(model: Product) {
        self.init()

        self.model = model
    }

    public func config(cell: UICollectionViewCell) {

        
    }
}
