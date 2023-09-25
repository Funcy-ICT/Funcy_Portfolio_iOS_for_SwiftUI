//
//  WorkViewModel.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/15.
//

import Foundation
import YouTubePlayerKit

class WorkViewModel: ObservableObject {
    @Published var work: WorkDatail?
    @Published var articleID: ArticleID?
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    init() {
        let defaultImageURL = URL(string: "http://localhost:3004/db729985-cef5-4c5e-826c-154bf3f03e06kumaPoster.png")!
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
        self.articleID = ArticleID(articleID: "3daba91a-667b-433b-bb54-0021a4f8229e")
    }
    
    func fetchWorkDatailService() {
        isLoading = true
        Task.detached {
            do {
                let response = try await WorkDatailAPIService.shared.fetchWorkDatailService(articleID: self.articleID!.articleID)
                
                DispatchQueue.main.async {
                    self.work = response
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
}
