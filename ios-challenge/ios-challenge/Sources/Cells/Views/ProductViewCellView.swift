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

    lazy public var plusBadgeImage = {
        return UIImage(named: "product-linio-plus-badge")
    }()
    
    lazy public var plus48BadgeImage = {
        return UIImage(named: "product-linio-plus48-badge")
    }()
    
    lazy public var refurbishedImage = {
        return UIImage(named: "product-refurbished")
    }()
    
    lazy public var newImage = {
        return UIImage(named: "product-new")
    }()
    
    lazy public var importedImage = {
        return UIImage(named: "product-imported")
    }()
    
    lazy public var freeShippingImage = {
        return UIImage(named: "product-free-shipping")
    }()

    // Array containing Badges ImageViews to show
    public var badgeImages = [UIImageView]()

    private let maxNumberOfIcons = 4

    override init(frame: CGRect) {
        super.init(frame: frame)

        // configuring rounded corners
        layer.cornerRadius = 9
        layer.masksToBounds = true

        initProductImageView()
        initIconImageViews()
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
        badgeImages.forEach { badge in
            badge.image = nil
        }
    }

    public func setIcon(image: UIImage, at index: Int) {

        badgeImages[index].image = image
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
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        productImage = imageView

        // adding favorite icon
        let spacing: CGFloat = 4
        let favoriteIcon = UIImageView(image: UIImage(named: "product-favorite"))
        favoriteIcon.frame.origin = CGPoint(x: frame.width - favoriteIcon.frame.width - spacing, y: spacing)
        addSubview(favoriteIcon)
    }

    private func initIconImageViews() {

        let imageWidth = 30

        for index in 0...maxNumberOfIcons {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: 0, y: imageWidth * index, width: 30, height: 30)
            addSubview(imageView)
            badgeImages.append(imageView)
        }
    }

}
