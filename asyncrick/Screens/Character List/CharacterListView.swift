//
//  CharacterListView.swift
//  asyncrick
//
//  Created by Alex Logan on 07/06/2021.
//

import SwiftUI

struct CharacterListView: View {
    
    @EnvironmentObject var characterListViewModel: CharacterListViewModel
        
    @State var searchText: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack {
                contentBody
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), suggestions: {
            if let characters = try? characterListViewModel.dataResult?.get() {
                ForEach(characters.filter({ $0.name.starts(with: searchText )}), id: \.self) { character in
                    Text(character.name)
                        .searchCompletion(character.name)
                }
            }
        })
        .navigationTitle("AsyncRick")
        .background(Color(uiColor: .systemGroupedBackground))
        .onAppear {
            characterListViewModel.loadData()
        }
        
    }

    // MARK: - Child Views
    @ViewBuilder
    var contentBody: some View {
        switch characterListViewModel.dataResult {
            case .success(let characters):
                characterList(from: characters.filter({ $0.name.hasPrefix(searchText )}))
            case .failure:
                errorView
            case .none:
                loadingView
        }
    }
    
    @ViewBuilder
    var loadingView: some View {
        Spacer()
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
        Spacer()
    }

    @ViewBuilder
    var errorView: some View {
        Spacer()
        VStack(alignment: .center, spacing: 12) {
            Text("It looks like something has gone wrong, please tap below to try again.")
            Button {
                self.loadContent()
            } label: {
                Text("Reload")
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12, style: .continuous).foregroundColor(.accentColor))
            }
        }
        .padding()
        Spacer()
    }
        
    func characterList(from characters: [Character]) -> some View {
        ForEach(characters, id: \.self) { character in
            CharacterView(character: character)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .foregroundColor(Color(uiColor: .systemBackground))
                )
                .padding()
        }
    }
    
    // MARK: - Setup
    func loadContent() {
        characterListViewModel.loadData()
    }

}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
            .environmentObject(CharacterListViewModel())
    }
}
