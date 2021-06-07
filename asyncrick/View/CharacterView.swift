//
//  CharacterView.swift
//  asyncrick
//
//  Created by Alex Logan on 07/06/2021.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            avatarView
            informationView
            Spacer()
        }
    }
    
    var avatarView: some View {
        AsyncImage(url: URL(string: character.image)) { image in
            image
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
        } placeholder: {
            Color.gray
        }
        .frame(width: 64, height: 64)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
    
    var informationView: some View {
        VStack(alignment: .leading) {
            Text(character.name)
                .font(.headline)
            Text(character.species.rawValue)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(character: .rick)
    }
}
