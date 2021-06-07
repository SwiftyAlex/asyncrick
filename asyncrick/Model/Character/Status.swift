//
//  Status.swift
//  asyncrick
//
//  Created by Alex Logan on 08/06/2021.
//

import Foundation

enum Status: String, Codable, Hashable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
