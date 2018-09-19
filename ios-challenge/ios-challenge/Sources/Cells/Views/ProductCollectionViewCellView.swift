//
//  ProductCollectionViewCellView.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

class ProductCollectionViewCellView: UIView {

    private var productImages: [UIImageView]!

    private weak var title: UILabel!
    private weak var numberOfItems: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        initProductImageViews()
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

        productImages?.forEach { badge in
            badge.image = nil
        }
        productImages = nil
        title?.text = nil
        numberOfItems.text = nil
    }
    
    // Initialize productImageView
    private func initProductImageViews() {

        let mainWidthPercent: CGFloat = 0.7
        let miniumSpacing: CGFloat = 10
        let imagesTotalWidth = frame.width - (miniumSpacing * 3)
        let mainImageWidth = imagesTotalWidth * mainWidthPercent

        let background = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: mainImageWidth + (miniumSpacing * 2)))
        background.backgroundColor = .componentsBackground
        addSubview(background)

        let mainImageView = UIImageView(frame: CGRect(x: miniumSpacing, y: miniumSpacing, width: mainImageWidth , height: mainImageWidth))

        let secondaryImagesWidth = imagesTotalWidth - mainImageWidth
        let secondaryTopImage = UIImageView(frame: CGRect(x: mainImageView.frame.maxX + miniumSpacing, y: miniumSpacing, width: secondaryImagesWidth, height: secondaryImagesWidth))
        let secondaryBottomImage = UIImageView(frame: CGRect(x: secondaryTopImage.frame.minX, y: secondaryTopImage.frame.maxY + miniumSpacing, width: secondaryImagesWidth, height: secondaryImagesWidth))

        productImages = [mainImageView, secondaryTopImage, secondaryBottomImage]

        for image in productImages {
            addSubview(image)
            image.backgroundColor = .white
            image.layer.cornerRadius = 5
            image.layer.masksToBounds = true
        }
    }

    private func initLabels() {

        title = UILabel(frame: CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>))
    }

}
