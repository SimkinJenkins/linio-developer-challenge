//
//  FavoritesViewViewModel.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 18/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import Alamofire

class FavoritesViewViewModel {

    // number of sections for CollectionView
    public var numberOfSections: Int {

        return model.sections?.count ?? 0
    }

    private var model: FavoritesViewModel!

    convenience init(model: FavoritesViewModel) {
        self.init()

        self.model = model
    }

    convenience init(userCollections: [ProductsCollection]) {
        self.init()

        initModel(userCollections)
    }

    public func getNumberOfItems(for section: Int) -> Int {

        return model.sections?[section].cells?.count ?? 0
    }

    // Manual Cells register
    public func registerCellClasses(for collectionView: UICollectionView) {

        collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: ProductsCollectionCellViewModel.reuseId)
        collectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: ProductViewCellViewModel.reuseId)
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: HeaderReusableView.reuseId)
    }

    // Mark: UICollectionView-ViewModel Methods
    public func getReusableCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {

        guard let viewModel = getViewModel(at: indexPath) else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseId, for: indexPath)
        return cell
    }

    public func getReusableSuplementaryView(ofKind kind: String, for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.reuseId, for: indexPath) as! HeaderReusableView
        view.label.text = model.sections[indexPath.section].headerTitle
        view.label.font = model.sections[indexPath.section].headerFont
        return view
    }

    public func getItemSize(for collectionView: UICollectionView, at indexPath: IndexPath) -> CGSize {

        let width = (collectionView.bounds.size.width * 0.5) - 14
        return CGSize(width: width, height: width)
    }

    public func getHeaderSize(for collectionView: UICollectionView, section: Int) -> CGSize {

        return CGSize(width: collectionView.frame.width, height: 48)
    }

    public func config(cell: UICollectionViewCell, at indexPath: IndexPath) {

        guard let viewModel = getViewModel(at: indexPath) else {
            return
        }
        viewModel.config(cell: cell)
    }

    public func didSelect(at indexPath: IndexPath) {

        guard let viewModel = getViewModel(at: indexPath) else {
            return
        }
        viewModel.didSelect()
    }

    // Mark: Networking
    public func loadData(completion: (() -> Void)?) {
        if model?.url == nil {
            return
        }
        Alamofire.request(model.url).responseString { response in

            
            var userCollections: [ProductsCollection]!
            do {
                userCollections = try JSONDecoder().decode([ProductsCollection].self, from: response.data!)
            } catch {
                print(error)
            }
            self.initModel(userCollections)
            completion?()
        }
    }

    // Initialize model with UserProductsCollection array
    private func initModel(_ userCollections: [ProductsCollection]) {
        let sections = [self.initCollectionsSection(userCollections: userCollections),
                        self.initAllProductsSection(userCollections: userCollections)]
        model = FavoritesViewModel(sections: sections)
    }

    // Get correspondent viewModel
    private func getViewModel(at indexPath: IndexPath) -> CellViewModelProtocol? {

        return model.sections?[indexPath.section].cells[indexPath.row]
    }

    // Initialize section User Products Collection starting api data
    private func initCollectionsSection(userCollections: [ProductsCollection]) -> CollectionViewSection {

        let productCollectionCellViewModel = userCollections.map { userCollection in
            return ProductsCollectionCellViewModel(model: userCollection)
        }
        return CollectionViewSection(headerTitle: "Favoritos", cells: productCollectionCellViewModel, headerFont: .sectionHeaderTitle)
    }

    // Initialize section All Products starting api data
    private func initAllProductsSection(userCollections: [ProductsCollection]) -> CollectionViewSection {

        var viewModels = [CellViewModelProtocol]()
        for userCollection in userCollections {
            for product in userCollection.products {
                viewModels.append(ProductViewCellViewModel(model: product.value))
            }
        }
        return CollectionViewSection(headerTitle: "Todos mis favoritos (\(viewModels.count))", cells: viewModels, headerFont: .sectionHeaderSubtitle)
    }

}
