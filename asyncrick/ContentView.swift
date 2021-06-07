//
//  ContentView.swift
//  asyncrick
//
//  Created by Alex Logan on 07/06/2021.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView {
            CharacterListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
