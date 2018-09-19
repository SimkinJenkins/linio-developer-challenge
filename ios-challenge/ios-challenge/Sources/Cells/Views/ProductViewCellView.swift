//
//  ProductCellView.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 16/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class ProductViewCellView: UIView {

    // Product ImageView
    private weak var productImage: UIImageView!

    // Array containing Badges ImageViews to show
    private var badgeImages: [UIImageView]!

    override init(frame: CGRect) {
        super.init(frame: frame)

        // configuring rounded corners
        layer.cornerRadius = 9
        layer.masksToBounds = true

        initProductImageView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        fatalError("Interface Builder is not supported!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        fatalError("Interface Builder is not supported!")
    }

    // Reset imageViews
    public func prepareForReuse() {

        productImage.image = nil
        badgeImages?.forEach { badge in
            badge.image = nil
        }
        badgeImages = nil
    }

    // Initialize productImageView
    private func initProductImageView() {

        let imageView = UIImageView(frame: frame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        imageView.backgroundColor = .white
        productImage = imageView
    }

}
