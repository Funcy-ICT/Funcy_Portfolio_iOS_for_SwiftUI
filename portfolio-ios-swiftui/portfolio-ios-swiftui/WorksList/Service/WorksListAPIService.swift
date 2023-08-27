//
//  WorkDatailService.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/16.
//

import Foundation

final class WorksListAPIService {
    
    static let shared = WorksListAPIService()
    
    public func fetchWorksListService(getWorksNum: Int) async throws -> WorksListDatail {
        
        // MARK: - 1.API取得先URLの作成
        // 本番環境ではURLを変更する
        let baseURL: URL = .init(string: "http://localhost:9000/works/\(getWorksNum)")!
        // let baseURL: URL = .init(string: "https://funcy.tennkyustudio.com/works/\(getWorksNum)")!
        var request = URLRequest(url: baseURL)
        
        // MARK: - 2.URLリクエストの作成
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // MARK: - 3.TASKの作成
        
        let data = try await URLSession.shared.data(for: request)
        let response: WorksListDatail = try JSONDecoder().decode(WorksListDatail.self, from: data.0)
        print(response.works[2])
        
        for responses in response.works {
            print(responses)
        }
        
        return response
         
    }
}
