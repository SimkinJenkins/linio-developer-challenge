//
//  ProductCollectionViewCell.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 15/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    static public let reuseId = "ProductCollectionViewCell"

    private weak var productImage: UIImageView!
    private var icons = [UIImageView]()

    override init(frame: CGRect) {
        super.init(frame: frame)

        initProductImage()
        contentView.backgroundColor = .collectionViewBackground
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

        productImage.image = nil
    }

    func initProductImage() {

        let image = UIImageView(frame: frame)
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            ])
        image.backgroundColor = .white
        image.layer.cornerRadius = 9
        image.layer.masksToBounds = true
        productImage = image
    }

}
