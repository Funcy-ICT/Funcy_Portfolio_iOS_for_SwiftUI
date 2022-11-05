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
    
    public func fetchLoginService(mail: String, password: String, completion: @escaping (Result<SignIn, Error>) -> Void) {
        
        let body: [String: String] = [
            "mail": "\(mail)",
            "password": "\(password)"
        ]
        
        // MARK: - 1.API取得先URLの作成
        
        // 本番環境ではURLを変更する
        guard let baseURL = URL(string: "http://localhost:8080/sign/in") else {
            return
        }
        var request = URLRequest(url: baseURL)
        
        // MARK: - 2.URLリクエストの作成
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        // MARK: - 3.TASKの作成
        let decorder = JSONDecoder()
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try decorder.decode(SignIn.self, from: data)
                completion(.success(response))
                print("SUCCESS: \(response)")
            } catch {
                completion(.failure(error))
            }
        }
        
        // MARK: - 4.TASKの実行
        task.resume()
    }
}
