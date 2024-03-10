//
//  LogOutAlertController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 9/3/24.
//

import Foundation
import UIKit

class LogoutAlertViewController: UIViewController {
    
    let logOutAlert = LogOutAlert()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logOutAlert)
        setupConstraintsLogoutAlertView()
        addTargets()
    }
    
    private func setupConstraintsLogoutAlertView(){
        logOutAlert.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addTargets(){
        logOutAlert.yesLogoutButton.addTarget(self, action: #selector(didTapYesLogoutButton), for: .touchUpInside)
        logOutAlert.stayButton.addTarget(self, action: #selector(didTapStayButton), for: .touchUpInside)
    }
    
    @objc func didTapYesLogoutButton(){
        print("Alert-Logout Button tapped")
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func didTapStayButton(){
        print("Stay tapped")
        dismiss(animated: true, completion: nil)
    }
}
