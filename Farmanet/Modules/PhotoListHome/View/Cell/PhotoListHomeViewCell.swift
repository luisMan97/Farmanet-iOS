//
//  PhotoListHomeViewCell.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import UIKit

class PhotoListHomeViewCell: BaseCollectionViewCell {
    
    var viewModel: PhotoHomeViewModel! {
        didSet {
            setup()
        }
    }
    
    let photoImageView = InitView(CustomImageView()) {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    let photoUserImageView = InitView(CustomImageView()) {
        $0.layer.cornerRadius = 22
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleAspectFill
    }
    
    let nameLabel = InitView(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 2
    }
    
    let likesLabel = InitView(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .lightGray
    }
    
    let separatorView = InitView(UIView()) {
        $0.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
    override func setupSubviews() {
        addSubview(photoImageView)
        addSubview(photoUserImageView)
        addSubview(nameLabel)
        addSubview(likesLabel)
        addSubview(separatorView)
        
        photoImageView.fixInViewWithAnchor(self,
                                           top: topAnchor,
                                           paddingTop: 16,
                                           bottom: photoUserImageView.topAnchor,
                                           paddingBottom: 8, left: leftAnchor,
                                           paddingLeft: 16,
                                           right: rightAnchor,
                                           paddingRight: 16
        )
        
        photoUserImageView.fixInViewWithAnchor(self,
                                               bottom: separatorView.topAnchor,
                                               paddingBottom: 8,
                                               left: photoImageView.leftAnchor,
                                               width: 44,
                                               height: 44
        )
        
        nameLabel.fixInViewWithAnchor(self,
                                      top: photoUserImageView.topAnchor,
                                      left: photoUserImageView.rightAnchor,
                                      paddingLeft: 8,
                                      right: photoImageView.rightAnchor
        )
        
        likesLabel.fixInViewWithAnchor(self,
                                       top: nameLabel.bottomAnchor,
                                       paddingTop: 2,
                                       left: nameLabel.leftAnchor,
                                       right: nameLabel.rightAnchor
        )
        
        separatorView.fixInViewWithAnchor(self,
                                          bottom: bottomAnchor,
                                          left: leftAnchor,
                                          right: rightAnchor,
                                          height: 1
        )
    }
    
    private func setup() {
        nameLabel.text = viewModel.userName
        likesLabel.text = viewModel.likes
        
        setupPhotoImage()
        setupPhotoUserImage()
    }
    
    private func setupPhotoImage() {
        if let imageUrl = viewModel.image {
            photoImageView.loadImageUsingUrlString(urlString: imageUrl)
        }
    }
    
    private func setupPhotoUserImage() {
        if let imageUrl = viewModel.userImage {
            photoUserImageView.loadImageUsingUrlString(urlString: imageUrl)
        }
    }

}
