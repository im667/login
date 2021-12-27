//
//  SignUpView.swift
//  login
//
//  Created by mac on 2021/12/28.
//

import Foundation
import UIKit
import SnapKit


protocol signUpViewRepresentable {
    
    func setupView()
    func setupConstraints()
    
}

class SignUpView: UIView,signUpViewRepresentable {
    
    
    let usernameTextField = UITextField()
    let userEmailTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        addSubview(userEmailTextField)
        userEmailTextField.backgroundColor = .white
        userEmailTextField.placeholder = "ex)sesac@sesac.com"
        addSubview(usernameTextField)
        usernameTextField.backgroundColor = .white
        usernameTextField.placeholder = "ex)ssac"
        addSubview(passwordTextField)
        passwordTextField.backgroundColor = .white
        passwordTextField.placeholder = "****"
        passwordTextField.isSecureTextEntry = true
        addSubview(signUpButton)
        signUpButton.backgroundColor = .orange
    }
    
    func setupConstraints() {
        userEmailTextField.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        usernameTextField.snp.makeConstraints{ make in
            make.top.equalTo(userEmailTextField.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
    }
    
    
    
}
