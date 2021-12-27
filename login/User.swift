//
//  User.swift
//  login
//
//  Created by mac on 2021/12/27.
//

import Foundation

struct User: Codable {
    let jwt: String
    let user: UserClass
}

// MARK: - UserClass
struct UserClass: Codable {
    let id: Int
    let username, email: String
}
