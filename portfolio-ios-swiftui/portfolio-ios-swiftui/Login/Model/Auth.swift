//
//  Auth.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/10/24.
//

import Foundation

struct Authinfo: Codable {
    let signup: SignUp
    let signin: SignIn
}

struct SignUp: Codable {
    let icon: String
    let familyName: String
    let firstName: String
    let mail: String
    let password: String
    let grade: String
    let course: String
    let displayName: String
  }

struct SignIn: Codable {
    let token: String
}
