//
//  PhotoListHomeViewController.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import UIKit

class PhotoListHomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let viewModel = PhotoListHomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        setupCollectionView()
        setupBindings()
    }
    
    func setupCollectionView() {
        collectionView?.backgroundColor = .white
        collectionView?.register(PhotoListHomeViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    private func setupBindings() {
        viewModel.showProgress.bind { show in
            print(show)
        }
        
        viewModel.photos.bind { [weak self] _ in
            self?.collectionView?.reloadData()
        }
        
        viewModel.error.bind { error in
            print(error)
        }
    }

}
