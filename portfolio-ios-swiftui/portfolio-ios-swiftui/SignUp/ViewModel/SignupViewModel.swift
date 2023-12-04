//
//  SignupViewModel.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/27.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var register: Register
    
    @Published var displayName: String
    @Published var userIcon: String
    @Published var familyName: String
    @Published var firstName: String
    @Published var mail: String
    @Published var password: String
    @Published var checkPassword: String
    
    @Published var grade: String
    @Published var course: String
    
    init() {
        self.register = Register(userID: "")
        
        self.displayName = ""
        self.userIcon = ""
        self.familyName = ""
        self.firstName = ""
        self.mail = ""
        self.password = ""
        self.checkPassword = ""
        self.grade = "学部1年"
        self.course = "未所属"
        
        fetchSignupService()
    }
    
    func fetchSignupService() {
        // MARK: - dispatchを使う理由はfetchに時間がかかるから、アプリの裏側で実行する
        Task.detached {
            do {
                let response = try await SignupAPIService.shared.fetchSignupService(displayName: self.displayName, userIcon: self.userIcon, familyName: self.familyName, firstName: self.firstName, mail: self.mail, password: self.password, grade: self.grade, course: self.course)
                // エラーがなければ必ず通る
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
