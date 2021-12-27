//
//  SignUpViewModel.swift
//  login
//
//  Created by mac on 2021/12/28.
//

import Foundation

class SignUpViewModel {
    
    var username: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    var userEmail: Observable<String> = Observable("")
    
    func postUserLogin(completion: @escaping ()->Void ) {
        
        APIService.login(identifier: username.value, password: password.value){ userData, error in
           
            guard let userData = userData else {
                return
            }
            
            UserDefaults.standard.set(userData.jwt, forKey: "token")
            UserDefaults.standard.set(userData.user.username, forKey: "nickname")
            UserDefaults.standard.set(userData.user.id, forKey: "id")
            UserDefaults.standard.set(userData.user.email, forKey: "email")

            completion()
        }
    }
}
