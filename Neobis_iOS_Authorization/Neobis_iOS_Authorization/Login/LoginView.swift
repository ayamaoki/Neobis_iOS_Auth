//
//  LoginView.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 28/2/24.
//

import Foundation
import UIKit
import SnapKit

class LogInViewController: UIViewController {
    let mainView = LogInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        mainView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func enterButtonTapped() {
        let vc = RegisterView()
        
    }
}

