//
//  WorkViewModel.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/15.
//

import Foundation

class WorkViewModel: ObservableObject {
    
    @Published var work: WorkDatail
    @Published var articleID: ArticleID
    
    init() {
        self.work = WorkDatail(title: "", description: "", images: [""], URL: URL(string: "")!, tags: [""], group: "", security: "")
        self.articleID = ArticleID(articleID: 1)
    }
    
    func fetchWorkDatailService() {
        Task.detached {
            do {
                let response = try await WorkDatailAPIService.shared.fetchWorkDatailService(articleID: self.articleID.articleID)
                // エラーがなければ必ず通る
                print(response)
                self.work = response
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
