//
//  WorksListViewModel.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/08/03.
//

import Foundation
import SwiftUI

class WorksListViewModel: ObservableObject {
    @Published var workList: WorksListDatail
    @Published var isLoading: Bool = false
    @Published var error: Error?
    @Published var data: [CustomCell] = []
        
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
        isLoading = true
        Task.detached {
            do {
                let response = try await WorksListAPIService.shared.fetchWorksListService(getWorksNum: 3)  // 取ってくる数を指定
                // エラーがなければ必ず通る
                DispatchQueue.main.async {
                    self.workList = response
                    
                    print(self.workList.works[0].title)
                    print(self.workList.works[1].title)
                    print(self.workList.works[2].title)
                    
                    print("customcell型に変更")
                    // print(self.workList.works[2].title)
                    self.isLoading = false
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.error = error
                    self.isLoading = false
                }
            }
        }
    }
}
