//
//  LoginViewController.swift
//  Farmanet
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = InitView(UILabel()) {
        $0.text = "Inciar Sesión"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 27)
    }

    let loginButton = InitView(UIButton()) {
        $0.setTitle("Inciar Sesión", for: .normal)
        $0.backgroundColor = .orange
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 22
        $0.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(loginButton)
        
        titleLabel.fixInViewWithAnchor(view,
                                       top: view.topAnchor,
                                       paddingTop: 90,
                                       centerX: view
        )
        
        loginButton.fixInViewWithAnchor(view,
                                        top: titleLabel.bottomAnchor,
                                        paddingTop: 10,
                                        width: 300,
                                        height: 44,
                                        centerX: view
        )
    }
    
    @objc private func goToHome() {
        let viewController = HomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}
