//
//  LoginViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 28/2/24.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    let mainView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        mainView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        mainView.newAccountButton.addTarget(self, action: #selector(newAccountTapped), for: .touchUpInside)
    }
    
    func setupView() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func enterButtonTapped() {
        let vc = ProfileViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func newAccountTapped() {
        let vc = RegisterViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
