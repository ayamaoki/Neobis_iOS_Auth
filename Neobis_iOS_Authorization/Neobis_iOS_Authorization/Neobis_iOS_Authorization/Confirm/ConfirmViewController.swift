//
//  ConfirmViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 9/3/24.
//

import Foundation
import UIKit

class ConfirmViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let confirmView = ConfirmView()
    let email: String
    
    init(email: String) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
        confirmView.titleLabel.text = "Выслали письмо со ссылкой\nдля завершения регистрации\nна \(email)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigation()
        view.addSubview(confirmView)
        setupView()
        addTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        confirmView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func navigation(){
        navigationItem.title = "Регистрация"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "back"),
            style: .plain,
            target: self,
            action: #selector(popBack))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func addTargets() {
        confirmView.resendButton.addTarget(self, action: #selector(resendButtonTapped), for: .touchUpInside)
    }
    
    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func resendButtonTapped() {
        print("i")
        
        let resendAlertVC = ResendAlertViewController()
        resendAlertVC.modalPresentationStyle = .overCurrentContext
        present(resendAlertVC, animated: false, completion: nil)
    }
}
