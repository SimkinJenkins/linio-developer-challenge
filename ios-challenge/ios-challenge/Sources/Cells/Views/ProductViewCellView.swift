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
    public weak var productImage: UIImageView!

    // Array containing Badges ImageViews to show
    public var badgeImages: [UIImageView]!

    lazy public var plusBadge: UIImageView = {
        return getIcon(imagename: "product-linio-plus-badge")
    }()

    lazy public var plus48Badge: UIImageView = {
        return getIcon(imagename: "product-linio-plus48-badge")
    }()

    lazy public var refurbished: UIImageView = {
        return getIcon(imagename: "product-refurbished")
    }()

    lazy public var new: UIImageView = {
        return getIcon(imagename: "product-new")
    }()

    lazy public var imported: UIImageView = {
        return getIcon(imagename: "product-imported")
    }()

    lazy public var freeShipping: UIImageView = {
        return getIcon(imagename: "product-free-shipping")
    }()

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

        // adding product thumbnail
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

        // adding favorite icon
        let spacing: CGFloat = 4
        let favoriteIcon = UIImageView(image: UIImage(named: "product-favorite"))
        favoriteIcon.frame.origin = CGPoint(x: frame.width - favoriteIcon.frame.width - spacing, y: spacing)
        addSubview(favoriteIcon)
    }

    private func getIcon(imagename: String) -> UIImageView {

        let imageView = UIImageView(image: UIImage(named: imagename))
        addSubview(imageView)
        return imageView
    }

}
