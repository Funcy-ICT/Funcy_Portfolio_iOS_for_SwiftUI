//
//  LoginViewModel.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/10/24.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var login: Login
    
    @Published var mail: String
    @Published var password: String
//    @Published var error
    
    init() {
        self.login = Login(token: "")
        self.mail = ""
        self.password = ""
        fetchLoginService()
    }
    
    func fetchLoginService() {
        LoginAPIService.shared.fetchLoginService(mail: mail, password: password) { result in
            // MARK: - dispatchを使う理由はfetchに時間がかかるから、アプリの裏側で実行する
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    self.login = token
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
