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

        var icons = [UIImageView]()
        switch model.linioPlusLevel {
        case 1:     icons.append(productCell.view.plusBadge)
        case 2:     icons.append(productCell.view.plus48Badge)
        default:    print("model.linioPlusLevel unknown", model.linioPlusLevel)
        }
        switch model.conditionType {
        case .new:          icons.append(productCell.view.new)
        case .refurbished:  icons.append(productCell.view.refurbished)
        }
        if model.imported {
            icons.append(productCell.view.imported)
        }
        print(model.freeShipping)
        if model.freeShipping {
            icons.append(productCell.view.freeShipping)
        }
        setupPositions(for: icons)
        productCell.view.badgeImages = icons
    }

    private func setupPositions(for icons: [UIImageView]) {

        var yPos: CGFloat = 0
        for icon in icons {
            icon.frame.origin.y = yPos
            yPos += icon.frame.height
        }
    }

}
