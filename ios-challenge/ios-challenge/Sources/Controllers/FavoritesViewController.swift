//
//  FavoritesViewController.swift
//  ios-challenge
//
//  Created by Patricio Bravo Cisneros on 14/09/18.
//  Copyright © 2018. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    weak var collectionView: UICollectionView!
    var viewModel: FavoritesViewViewModel!

    convenience init(viewModel: FavoritesViewViewModel) {
        self.init()

        self.viewModel = viewModel
    }

    override func loadView() {
        super.loadView()

        initCollectionView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
    }

    // Initialize CollectionView
    func initCollectionView() {

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        self.collectionView = collectionView
    }

    // Configuring CollectionView
    func configureCollectionView() {

        collectionView.backgroundColor = .collectionViewBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        viewModel?.registerCellClasses(for: collectionView)
    }

}

extension FavoritesViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return viewModel?.numberOfSections ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return viewModel.getNumberOfItems(for: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return viewModel.getReusableCell(for: collectionView, at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard kind == UICollectionElementKindSectionHeader else {
            return UICollectionReusableView()
        }
        return viewModel.getReusableSuplementaryView(ofKind: kind, for: collectionView, at: indexPath)
    }

}

extension FavoritesViewController: UICollectionViewDelegate {

    

}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return viewModel.getItemSize(for: collectionView, at: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return viewModel.getHeaderSize(for: collectionView, section: section)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 9
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 9
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)
    }

}
