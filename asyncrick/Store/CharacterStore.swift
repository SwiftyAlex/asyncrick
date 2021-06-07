//
//  CharacterStore.swift
//  asyncrick
//
//  Created by Alex Logan on 07/06/2021.
//

import Foundation

class CharacterStore {
    
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(urlSession: URLSession = .shared, jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.jsonDecoder = jsonDecoder
    }
    
    func fetchCharacters() async throws -> [Character] {
        let urlRequest = URLRequest(url: URL(string: "https://rickandmortyapi.com/api/character")!)
        let data = try await urlSession.data(for: urlRequest, delegate: nil)
        let decodedData = try jsonDecoder.decode(ResponseWrapper<Character>.self, from: data.0)
        return decodedData.results
    }
    
}
