//
//  Home.swift
//  SearchBar
//
//  Created by Davin Henrik on 3/4/22.
//

import SwiftUI

struct Home: View {
    @StateObject var searchData = SearchUser()
    var body: some View {
        VStack {
            
            CustomSearchBar(searchData: searchData)
            
            Spacer()
        }
        .onChange(of: searchData.query) { (newData) in
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                
                if searchData.query.count >= 3 && newData == searchData.query {
                    print("search \(newData)")

                        searchData.page = 1
                        searchData.find()
                        
                    } else {
                        searchData.searchedUser.removeAll()
                    }
                }
            }
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
