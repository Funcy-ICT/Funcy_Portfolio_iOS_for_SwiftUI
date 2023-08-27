//
//  WorksListViewModel.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/08/03.
//

import Foundation

class WorksListViewModel: ObservableObject {
    @Published var workList: WorksListDatail
    
    init() {
        let defaultImageURL = URL(string: "http://localhost:3004/3651b802-04d3-45db-a2f6-dfa5f7607d86Funport.png")!
        
        self.workList = WorksListDatail(works: [WorksListDatail.Work(workID: "",
                                                                     title: "null",
                                                                     thumbnail: defaultImageURL,
                                                                     description: "",
                                                                     icon: defaultImageURL)
                                                ]
                                        )
    }
    
    func fetchWorksListService() {
        Task.detached {
            do {
                let response = try await WorksListAPIService.shared.fetchWorksListService(getWorksNum: 3)  // 取ってくる数を指定
                // エラーがなければ必ず通る
                self.workList = response
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
