//
//  SignupService.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/27.
//

import Foundation

final class SignupAPIService {
    
    static let shared = SignupAPIService()
    private init() {}
    
    public func fetchSignupService(displayName: String, userIcon: String, familyName: String, firstName: String, mail: String, password: String, grade: String, course: String) async throws -> Register {
        
        let body: [String: String] = [
            "icon": "\(userIcon)",
            "familyName": "\(familyName)",
            "firstName": "\(firstName)",
            "mail": "\(mail)",
            "password": "\(password)",
            "grade": "\(grade)",
            "course": "\(course)",
            "displayName": "\(displayName)"
        ]
        
        // MARK: - 1.API取得先URLの作成
        // 本番環境ではURLを変更する
        let baseURL: URL = .init(string: "http://localhost:9000/sign/up")!
        var request = URLRequest(url: baseURL)
        
        // MARK: - 2.URLリクエストの作成
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        // MARK: - 3.TASKの作成
        let data = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Register.self, from: data.0)
        
        return response
    }
}
