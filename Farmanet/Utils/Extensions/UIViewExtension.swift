//
//  UIViewExtension.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

extension UIView {
    
    // MARK: - Auto layout
    
    func fixInViewWithConstraints(_ container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        //frame = container.frame
        
        container.addSubview(self)
        
        activateNSLayoutAnchor(container)
        // activateNSLayoutConstraint(container)
    }
    
    func activateNSLayoutConstraint(_ container: UIView) {
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
    
    func activateNSLayoutAnchor(_ container: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: container.leadingAnchor),
            trailingAnchor.constraint(equalTo: container.trailingAnchor),
            topAnchor.constraint(equalTo: container.topAnchor),
            bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
    
    func fixInView(_ container: UIView) {
        container.addSubview(self)
        frame = container.bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func fixInViewWithAnchor(_ container: UIView, top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0, centerX: UIView? = nil, paddingCenterX: CGFloat = 0, centerY: UIView? = nil, paddingCenterY: CGFloat = 0) {
        
        //container.addSubview(self)
        
        anchor(top: top, paddingTop: paddingTop, bottom: bottom, paddingBottom: paddingBottom, left: left, paddingLeft: paddingLeft, right: right, paddingRight: paddingRight, width: width, height: height, centerX: centerX, paddingCenterX: paddingCenterX, centerY: centerY, paddingCenterY: paddingCenterY)
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat = 0, bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat = 0, left: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, right: NSLayoutXAxisAnchor? = nil, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0, centerX: UIView? = nil, paddingCenterX: CGFloat = 0, centerY: UIView? = nil, paddingCenterY: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX.centerXAnchor, constant: paddingCenterX).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY.centerYAnchor, constant: paddingCenterY).isActive = true
        }
    }
    
}
