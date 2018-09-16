//
//  FavoritesCollectionHeader.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 15/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

class FavoritesCollectionHeader: UICollectionReusableView {

    static public let reuseId = "ProductCollectionViewCell"

    weak var label: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        initLabel()
        backgroundColor = .collectionViewBackground
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

        label.text = nil
    }

    func initLabel() {

        let label = UILabel(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .sectionHeaderTitle
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        self.label = label
    }

}
