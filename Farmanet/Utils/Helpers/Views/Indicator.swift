//
//  Indicator.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import UIKit

class Indicator {
    
    static let shared = Indicator()
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()

    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = .black
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        indicator.style = .large
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .white
    }

    func showIndicator(){
        DispatchQueue.main.async {
            if let keyWindow = UIWindow.key {
                keyWindow.addSubview(self.blurImg)
                keyWindow.addSubview(self.indicator)
            }
        }
    }
    
    func hideIndicator(){
        DispatchQueue.main.async {
            self.blurImg.removeFromSuperview()
            self.indicator.removeFromSuperview()
        }
    }
    
}
