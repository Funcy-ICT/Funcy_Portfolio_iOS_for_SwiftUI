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
        // MARK: - dispatchを使う理由はfetchに時間がかかるから、アプリの裏側で実行する
        Task.detached {
            do {
                let response = try await LoginAPIService.shared.fetchLoginService(mail: self.mail, password: self.password)
                // エラーがなければ必ず通る
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
