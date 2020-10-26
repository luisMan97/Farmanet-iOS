//
//  StoreHomeViewCell.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

class StoreHomeViewCell: BaseTableViewCell {
    
    var viewModel: StoreHomeViewModel! {
        didSet {
            setup()
        }
    }
    
    var localNameLabel = InitView(UILabel()) {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    
    var localAdressLabel = InitView(UILabel()) {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.numberOfLines = 0
        $0.textColor = .gray
    }
    
    var localidadNameLabel = InitView(UILabel()) {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .lightGray
    }
    
    let separatorView = InitView(UIView()) {
        $0.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
    override func setupSubviews() {
        addSubview(localNameLabel)
        addSubview(localAdressLabel)
        addSubview(localidadNameLabel)
        
        localNameLabel.fixInViewWithAnchor(self,
                                           top: topAnchor,
                                           paddingBottom: 18,
                                           left: leftAnchor,
                                           paddingLeft: 8,
                                           right: rightAnchor,
                                           paddingRight: 8
        )
        
        localAdressLabel.fixInViewWithAnchor(self,
                                             top: localNameLabel.bottomAnchor,
                                             paddingTop: 8,
                                             left: localNameLabel.leftAnchor,
                                             right: localNameLabel.rightAnchor
        )
        
        localidadNameLabel.fixInViewWithAnchor(self,
                                             top: localAdressLabel.bottomAnchor,
                                             paddingTop: 8,
                                             left: localNameLabel.leftAnchor,
                                             right: localNameLabel.rightAnchor
        )
    }
    
    private func setup() {
        localNameLabel.text = viewModel.name
        localAdressLabel.text = viewModel.address
        localidadNameLabel.text = viewModel.locationName
    }

}
