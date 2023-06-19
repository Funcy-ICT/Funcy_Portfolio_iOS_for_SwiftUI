//
//  Work.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2023/02/15.
//

import Foundation

struct Image: Codable {
    let image: URL?
}

struct Tag: Codable {
    let tag: String
}

struct WorkDatail: Codable {
    let title: String
    let description: String
    let images: [Image]
    let tags: [Tag]
    let user_icon: URL
    let user_name: String
    let work_url: URL
    let movie_url: URL
    let security: Int
}

struct ArticleID: Codable {
    let articleID: String
}
