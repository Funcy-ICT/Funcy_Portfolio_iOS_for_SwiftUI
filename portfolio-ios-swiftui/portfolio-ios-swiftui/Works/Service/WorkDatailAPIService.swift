//
//  WorkDatailService.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/16.
//

import Foundation

final class WorkDatailAPIService {
    
    static let shared = WorkDatailAPIService()
    
    public func fetchWorkDatailService(articleID: String) async throws -> WorkDatail {
        
        // MARK: - 1.API取得先URLの作成
        // 本番環境ではURLを変更する
        let baseURL: URL = .init(string: "http://localhost:9000/work/\(articleID)")!
        var request = URLRequest(url: baseURL)
        
        // MARK: - 2.URLリクエストの作成
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // MARK: - 3.TASKの作成
        let data = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(WorkDatail.self, from: data.0)
        
        return response
    }
}
