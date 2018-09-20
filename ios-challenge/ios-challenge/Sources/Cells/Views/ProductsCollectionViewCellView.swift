//
//  ProductsCollectionViewCellView.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

class ProductsCollectionViewCellView: UIView {

    public var productThumbnails: [UIImageView]!
    
    public weak var title: UILabel!
    public weak var numberOfItems: UILabel!

    // Internal spacing between cell elements
    private let miniumSpacing: CGFloat = 8
    // Auxiliar value to calculate bigThumb size
    private let widthPercent: CGFloat = 0.69
    // Total width available to calculate thumbnails size
    private var totalWidthForImages: CGFloat!
    // Big Thumb size
    private var bigThumbnailWidth: CGFloat!
    // Thumbnails section background height
    private var thumbnailsSectionHeight: CGFloat!

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Calculating thumbnails width
        totalWidthForImages = frame.width - (miniumSpacing * 3)
        bigThumbnailWidth = totalWidthForImages * widthPercent
        thumbnailsSectionHeight = bigThumbnailWidth + (miniumSpacing * 2)

        backgroundColor = .white
        initProductImageViews()
        initLabels()
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

        productThumbnails?.forEach { badge in
            badge.image = nil
        }
        title?.text = nil
        numberOfItems.text = nil
    }

    // Initialize productImageView
    private func initProductImageViews() {

        // Total width available to calculate thumbnails size
        let totalWidthForImages = frame.width - (miniumSpacing * 3)
        // Auxiliar value to calculate bigThumb size
        let widthPercent: CGFloat = 0.69
        // Big Thumb size
        let bigThumbnailWidth = totalWidthForImages * widthPercent

        // Gray background for thumbnails section
        let background = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: thumbnailsSectionHeight))
        background.backgroundColor = .componentsBackground
        addSubview(background)

        // Left thumbnail
        let bigThumbnailView = UIImageView(frame: CGRect(x: miniumSpacing, y: miniumSpacing, width: bigThumbnailWidth, height: bigThumbnailWidth))

        // Right thumbnails
        let smallThumbnailsWidth = totalWidthForImages - bigThumbnailWidth
        let sThumbnailTopImage = UIImageView(frame: CGRect(x: bigThumbnailView.frame.maxX + miniumSpacing, y: miniumSpacing, width: smallThumbnailsWidth, height: smallThumbnailsWidth))
        let sThumbnailBottomImage = UIImageView(frame: CGRect(x: sThumbnailTopImage.frame.minX, y: sThumbnailTopImage.frame.maxY + miniumSpacing, width: smallThumbnailsWidth, height: smallThumbnailsWidth))

        productThumbnails = [bigThumbnailView, sThumbnailTopImage, sThumbnailBottomImage]

        // Setting thumbnails
        for image in productThumbnails {
            image.backgroundColor = .white
            image.layer.cornerRadius = 5
            image.layer.masksToBounds = true
            addSubview(image)
        }
    }

    private func initLabels() {

        let infoSectionHeight = frame.height - thumbnailsSectionHeight
        let labelsHeight = (infoSectionHeight - (miniumSpacing * 2)) * 0.5

        let title = UILabel(frame: CGRect(x: miniumSpacing, y: thumbnailsSectionHeight + miniumSpacing, width: frame.width - (miniumSpacing * 2), height: labelsHeight))
        title.font = .userCollectionTitle
        title.textColor = .textColor
        addSubview(title)
        self.title = title

        let subtitle = UILabel(frame: CGRect(x: miniumSpacing, y: title.frame.maxY, width: title.frame.width, height: labelsHeight))
        subtitle.font = .userCollectionSubtitle
        subtitle.textColor = .softText
        addSubview(subtitle)
        self.numberOfItems = subtitle

    }

}
