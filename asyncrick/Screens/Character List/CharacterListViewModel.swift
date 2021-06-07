//
//  CharacterListViewModel.swift
//  asyncrick
//
//  Created by Alex Logan on 07/06/2021.
//

import Foundation
import Combine

enum NetworkError : Error {
    case fake
}

class CharacterListViewModel: ObservableObject {
    
    @Published var dataResult: Result<[Character], Error>?
    
    private let characterStore = CharacterStore()
    
    @MainActor
    func loadData() {
        // Reset
        self.dataResult = nil
        // Fetch new
        async {
            do {
                let characters = try await characterStore.fetchCharacters()
                self.dataResult = .success(characters)
            } catch let erorr {
                self.dataResult = .failure(erorr)
            }
        }

    }
}
