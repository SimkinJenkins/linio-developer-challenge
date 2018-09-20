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

        guard let productCell = cell as? ProductViewCell else {
            return
        }

        var icons = [UIImage]()
        switch model.linioPlusLevel {
        case 1:     icons.append(productCell.view.plusBadgeImage!)
        case 2:     icons.append(productCell.view.plus48BadgeImage!)
        default:    print("model.linioPlusLevel unknown", model.linioPlusLevel)
        }
        switch model.conditionType {
        case .new:          icons.append(productCell.view.newImage!)
        case .refurbished:  icons.append(productCell.view.refurbishedImage!)
        }
        if model.imported {
            icons.append(productCell.view.importedImage!)
        }
        if model.freeShipping {
            icons.append(productCell.view.freeShippingImage!)
        }

        for (index, image) in icons.enumerated() {
            productCell.view.setIcon(image: image, at: index)
        }
    }

}
