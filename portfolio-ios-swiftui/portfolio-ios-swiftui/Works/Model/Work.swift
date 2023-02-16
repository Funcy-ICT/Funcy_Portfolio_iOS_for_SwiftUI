//
//  Work.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/15.
//

import Foundation

struct WorkDatail: Codable {
    let title: String
    let description: String
    let images: [String]
    let URL: URL
    let tags: [String]
    let group: String
    let security: String
}

struct ArticleID: Codable {
    let articleID: Int
}
