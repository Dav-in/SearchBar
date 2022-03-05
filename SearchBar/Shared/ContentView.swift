//
//  ContentView.swift
//  Shared
//
//  Created by Davin Henrik on 3/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            Home()
                .preferredColorScheme(.dark)
                .navigationTitle("Github Users")
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
