//
//  FavoritesViewViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018 Linio. All rights reserved.
//

import UIKit

class FavoritesViewViewModel: NSObject {

    public var numberOfSections: Int {

        return model.sections?.count ?? 0
    }

    private var model: FavoritesViewModel!

    convenience init(model: FavoritesViewModel) {
        self.init()

        self.model = model
    }

    public func getNumberOfItems(for section: Int) -> Int {

        return model.sections?[section].cells?.count ?? 0
    }

    public func registerCellClasses(for collectionView: UICollectionView) {
        collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: ProductsCollectionViewCell.reuseId)
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderReusableView.reuseId)
    }

    public func getReusableCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.reuseId, for: indexPath)
        return cell
    }

    public func getReusableSuplementaryView(ofKind kind: String, for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.reuseId, for: indexPath) as! HeaderReusableView
        view.label.text = indexPath.section == 0 ? "Favoritos" : "Todos mis favoritos (16)"
        if indexPath.section == 1 {
            view.label.font = .sectionHeaderSubtitle
        }
        return view
    }

    public func getItemSize(for collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.size.width * 0.5) - 14
        return CGSize(width: width, height: width)
    }

    public func getHeaderSize(for collectionView: UICollectionView, section: Int) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 48)
    }

    private func getViewModel(for indexPath: IndexPath) -> ProductsCollectionViewModel? {

        return model.sections?[indexPath.section].cells?[indexPath.count] ?? nil
    }

}
