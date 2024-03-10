//
//  RegisterViewController.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 8/3/24.
//

import Foundation
import UIKit
import SnapKit

class RegisterViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let registerView =  RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        registerNavigation()
        addTarget()
        registerView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        view.addSubview(registerView)
        registerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    func registerNavigation() {
        navigationItem.title = "Регистрация"
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(popBack))
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    func addTarget() {
        registerView.passwordTextField.addTarget(self, action: #selector(createPassword), for: .editingChanged)
        registerView.repeatPasswordTextField.addTarget(self, action: #selector(confirmPassword), for: .editingChanged)
        registerView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func createPassword() {
        if let password = registerView.passwordTextField.text {
            validPassword(password)
        }
    }
    
    func validPassword(_ password: String) -> Bool {
        let requirements = [
            (registerView.firstPasswordRequirement, validLength(password)),
            (registerView.secondPasswordRequirement, hasLetters(password)),
            (registerView.thirdPasswordRequirement, hasNumber(password)),
            (registerView.fourthPasswordRequirement, specialCharacter(password))]

        for (label, requirementMet) in requirements {
            requirementLabel(label, requirement: requirementMet)
        }

        let allRequirements = requirements.allSatisfy { $0.1 }

        registerView.passwordTextField.textColor = allRequirements ? .black : .systemRed

        return allRequirements
    }
    
    func requirementLabel(_ label: UILabel, requirement: Bool) {
        
        var labelTitle = label.text ??  ""
        labelTitle = String(labelTitle.dropLast())
        
        if requirement {
            labelTitle += "✅"
            label.textColor = .systemGreen
        } else {
            labelTitle += "❌"
            label.textColor = .systemRed
        }
        
        label.text = labelTitle
    }
    
    func validLength(_ password: String) -> Bool {
        let length = password.count
        let maxLength = 15
        let minLength = 8
        return length >= minLength && length <= maxLength
    }
    
    func hasLetters(_ password: String) -> Bool {
        let lowercaseSet = CharacterSet.lowercaseLetters
        let uppercaseSet = CharacterSet.uppercaseLetters
        
        return password.rangeOfCharacter(from: lowercaseSet) != nil && password.rangeOfCharacter(from: uppercaseSet) != nil
    }
    
    func hasNumber(_ password: String) -> Bool {
        return password.contains { $0.isNumber }
    }
    
    func specialCharacter(_ password: String) -> Bool {
        let specialCharacterSet = CharacterSet(charactersIn: "@$!%*?&")
        return password.rangeOfCharacter(from: specialCharacterSet) != nil
    }
    
    @objc func confirmPassword() -> Bool {
        let passwordsMatch = registerView.passwordTextField.text == registerView.repeatPasswordTextField.text
        
        registerView.repeatPasswordTextField.textColor = passwordsMatch ? .black : .systemRed
        registerView.passwordNotMatchLabel.isHidden = passwordsMatch
        
        return passwordsMatch
    }

    @objc func popBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextButtonTapped() {
        guard let email = registerView.emailTextField.text else { return print("error") }
        let vc = ConfirmViewController(email: email)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
