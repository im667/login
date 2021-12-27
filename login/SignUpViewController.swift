//
//  SignUpViewController.swift
//  login
//
//  Created by mac on 2021/12/28.
//


import UIKit

class SignUpViewController: UIViewController {
    
    let mainView = SignUpView()
    var viewModel = SignUpViewModel()
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if UserDefaults.standard.string(forKey: "token") != nil{
            
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            
            }
        }
        
        
        viewModel.userEmail.bind { text in
            self.mainView.userEmailTextField.text = text
        }
  
        viewModel.username.bind { text in
            self.mainView.usernameTextField.text = text
        }
        
        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
   
        
        mainView.usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        
        
        mainView.userEmailTextField.addTarget(self, action: #selector(userEmailTextFieldDidChange(_:)), for: .editingChanged)
        
        
        mainView.signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }

    @objc func passwordTextFieldDidChange(_ textfield: UITextField){
        viewModel.password.value = textfield.text ?? ""
    }
    
    @objc func userEmailTextFieldDidChange(_ textfield: UITextField){
        viewModel.userEmail.value = textfield.text ?? ""
    }
    
    
    @objc func usernameTextFieldDidChange(_ textfield: UITextField){
        viewModel.username.value = textfield.text ?? ""
    }
    
    
    @objc func signUpButtonClicked(){
        viewModel.postUserLogin {
            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: SignInViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }

}

