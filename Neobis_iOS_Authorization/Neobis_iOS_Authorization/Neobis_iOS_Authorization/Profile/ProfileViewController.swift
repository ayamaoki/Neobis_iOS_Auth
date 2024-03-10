//
//  ProfileViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 9/3/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var profileView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileView)
        setupConstraintsRegisterView()
        addTargets()
    }
    
    func setupConstraintsRegisterView(){
        profileView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addTargets() {
        profileView.logOutButton.addTarget(self, action: #selector(logoutButton), for: .touchUpInside)
    }
    
    @objc func logoutButton(){
        print("Logout button tapped")
        
        let logOutAlertVC = LogoutAlertViewController()
        logOutAlertVC.modalPresentationStyle = .overFullScreen
        navigationController?.pushViewController(logOutAlertVC, animated: false)
    
    }
}

