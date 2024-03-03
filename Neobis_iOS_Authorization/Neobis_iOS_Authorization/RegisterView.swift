//
//  RegisterView.swift
//  Neobis_iOS_Authorization
//
//  Created by Yo on 3/3/24.
//

import UIKit

class RegisterView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Создать аккаунт\nLorby"
        label.font = UIFont(name: "MPLUS1p-Medium", size: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
}
