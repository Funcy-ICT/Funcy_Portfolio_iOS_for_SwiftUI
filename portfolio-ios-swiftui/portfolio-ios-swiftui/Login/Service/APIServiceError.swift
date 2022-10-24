//
//  APIServiceError.swift
//  portfolio-ios-swiftui
//
//  Created by 鳥山英峻 on 2022/10/24.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}
