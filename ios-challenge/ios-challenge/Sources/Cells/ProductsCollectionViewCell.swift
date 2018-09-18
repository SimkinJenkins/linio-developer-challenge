//
//  ProductsCollectionViewCell.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 15/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    // it can be used to conform a Protocol for implement dynamic Cells creation
    static public let reuseId = "ProductsCollectionViewCell"

    // Custom contentView
    public var view: ProductCellView!


    override init(frame: CGRect) {
        super.init(frame: frame)

        initCustomView(ProductCellView(frame: CGRect(origin: .zero, size: frame.size)))
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        fatalError("Interface Builder is not supported!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        fatalError("Interface Builder is not supported!")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        view.prepareForReuse()
    }

    // Initialize custom view
    private func initCustomView(_ view: ProductCellView) {

        contentView.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        self.view = view
    }

}
