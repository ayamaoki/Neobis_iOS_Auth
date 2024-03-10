//
//  ViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 26/2/24.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        mainView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    func setupView() {
        view.addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func continueButtonTapped() {
        let vc = LoginViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
