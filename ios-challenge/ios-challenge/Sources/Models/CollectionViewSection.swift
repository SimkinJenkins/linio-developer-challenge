//
//  CollectionViewSection.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 20/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

// Containts header and cell Data for a single section on a UICollectionView
struct CollectionViewSection {
    
    var headerTitle: String!
    var cells: [CellViewModelProtocol]!
    
    var headerFont: UIFont = .sectionHeaderTitle
}
