//
//  LoginService.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/10/24.
//

import Foundation
import SwiftUI

final class LoginAPIService {
    
    static let shared = LoginAPIService()
    private init() {}
    
    public func fetchLoginService(mail: String, password: String) async throws -> Login {
        
        let body: [String: String] = [
            "mail": "\(mail)",
            "password": "\(password)"
        ]
        
        // MARK: - 1.API取得先URLの作成
        // 本番環境ではURLを変更する
        let baseURL: URL = .init(string: "http://localhost:9000/login")!
        var request = URLRequest(url: baseURL)
        
        // MARK: - 2.URLリクエストの作成
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        // MARK: - 3.TASKの作成
        let data = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(Login.self, from: data.0)
        
        return response
    }
}
