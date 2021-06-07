//
//  ResponseWrapper.swift
//  asyncrick
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation

struct ResponseWrapper<Content: Codable>: Codable {
    let info: ResponseInfo
    let results: [Content]
}

struct ResponseInfo: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}
