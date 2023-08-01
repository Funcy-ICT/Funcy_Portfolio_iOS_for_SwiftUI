//
//  WorkViewModel.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/15.
//

import Foundation
import YouTubePlayerKit

class WorkViewModel: ObservableObject {
    
    @Published var work: WorkDatail
    @Published var articleID: ArticleID
    
    init() {
        let defaultImageURL = URL(string: "http://localhost:3004/2a9d4ce5-9dec-410c-8cdd-9eea59e4c18fmaxresdefault.jpg")!
        let defaultWorkURL = URL(string: "https://github.com")!
        let defaultMovieURL = URL(string: "https://www.youtube.com/watch?v=PupqolMfdqI")!
        
        self.work = WorkDatail(title: "",
                               description: "",
                               images: [Image(image: defaultImageURL)],
                               tags: [Tag(tag: "")],
                               icon: defaultImageURL,
                               userName: "",
                               work: defaultWorkURL,
                               movie: defaultMovieURL,
                               security: 1
        )
        self.articleID = ArticleID(articleID: "f9cdde7e-ccea-4f69-aea1-f291cfefa223")
    }
    
    func fetchWorkDatailService() {
        Task.detached {
            do {
                let response = try await WorkDatailAPIService.shared.fetchWorkDatailService(articleID: self.articleID.articleID)
                // エラーがなければ必ず通る
                self.work = response
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
