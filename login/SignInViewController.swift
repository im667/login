//
//  ViewController.swift
//  login
//
//  Created by mac on 2021/12/27.
//

import UIKit

class SignInViewController: UIViewController {
    
    let mainView = SignInView()
    var viewModel = SignInViewModel()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        viewModel.username.bind { text in
            print(text)
            self.mainView.usernameTextField.text = text
        }
        
        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
        mainView.usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        
        mainView.signInButton.addTarget(self, action: #selector(signInButtonClicked), for: .touchUpInside)
    }

    @objc func passwordTextFieldDidChange(_ textfield: UITextField){
        viewModel.password.value = textfield.text ?? ""
    }
    
    
    @objc func usernameTextFieldDidChange(_ textfield: UITextField){
        viewModel.username.value = textfield.text ?? ""
    }
    
    
    @objc func signInButtonClicked(){
        viewModel.postUserLogin {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }

}

