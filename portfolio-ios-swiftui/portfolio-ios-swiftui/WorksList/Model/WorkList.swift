//
//  WorkList.swift
//  portfolio-ios-swiftui
//
//  Created by massu on 2023/08/04.
//

import Foundation

struct WorksListDatail: Codable {
    let works: [Work]
    
    struct Work: Codable {
        let workID: String
        let title: String
        let thumbnail: URL?
        let description: String
        let icon: URL?
    }
}
