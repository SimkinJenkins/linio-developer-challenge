//
//  ProductsCollectionCellViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import AlamofireImage

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

    // Mark : CellViewModelProtocol
    public func config(cell: UICollectionViewCell) {

        guard  let productsCell = cell as? ProductsCollectionViewCell else {
            return
        }
        productsCell.view?.title.text = model.name
        productsCell.view?.numberOfItems.text = "\(model.products.count)"

        for (index, product) in model.products.enumerated() {
            if index < 3 {
                productsCell.view?.productThumbnails[index].af_setImage(withURL: product.value.imageUrl)
            }
        }
    }

    public func didSelect() {

        print("didSelect")
    }

}
