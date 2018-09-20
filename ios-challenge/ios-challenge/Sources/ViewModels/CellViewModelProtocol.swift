//
//  ViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

protocol CellViewModelProtocol {

    // a value for reuseIdentifier
    var reuseId: String { get }

    // config cell on UICollectionView willDisplay
    func config(cell: UICollectionViewCell)
    // on select
    func didSelect()
}
