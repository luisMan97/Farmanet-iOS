//
//  HomeViewController.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = StoreListHomeViewModel()
    
    let storesTableView = InitView(UITableView()) {
        $0.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupTableView()
        setupBindings() 
    }
    
    private func addSubviews() {
        storesTableView.fixInView(view)
    }
    
    private func setupBindings() {
        viewModel.showProgress.bind { show in
            if show {
                Indicator.shared.showIndicator()
            } else {
                Indicator.shared.hideIndicator()
            }
        }
        
        viewModel.stores.bind { [weak self] _ in
            self?.storesTableView.reloadData()
        }
        
        viewModel.error.bind { error in
            print(error)
        }
    }
    
    private func setupTableView() {
        storesTableView.register(StoreHomeViewCell.self, forCellReuseIdentifier: "cell")
        storesTableView.delegate = self
        storesTableView.dataSource = self
    }

}
