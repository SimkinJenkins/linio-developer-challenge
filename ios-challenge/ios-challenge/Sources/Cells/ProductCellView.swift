//
//  ProductCellView.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 16/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

class ProductCellView: UIView {

    private weak var product: UIImageView!
    private var badges = [UIImageView]()

    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.cornerRadius = 9
        layer.masksToBounds = true
        initProductImage()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        fatalError("Interface Builder is not supported!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        fatalError("Interface Builder is not supported!")
    }

    public func prepareForReuse() {

        product.image = nil
    }

    private func initProductImage() {

        let image = UIImageView(frame: frame)
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        image.backgroundColor = .white
        product = image
    }

}
