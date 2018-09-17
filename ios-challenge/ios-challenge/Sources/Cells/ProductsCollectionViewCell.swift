//
//  ProductsCollectionViewCell.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 15/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    static public let reuseId = "ProductsCollectionViewCell"

    public var view: ProductCellView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView(view: ProductCellView(frame: CGRect(origin: .zero, size: frame.size)))
    }

    func setupView(view: UIView) {

        contentView.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
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

}
