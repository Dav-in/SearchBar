//
//  CustomSearchBar.swift
//  SearchBar
//
//  Created by Davin Henrik on 3/4/22.
//

import SwiftUI

struct CustomSearchBar: View {
    @ObservedObject var searchData : SearchUser
    
    var body: some View {
        VStack(spacing: 0){
            
            HStack(spacing: 12){
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                TextField("Search", text: $searchData.query)
                    .autocapitalization(.none)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            
            if !searchData.searchedUser.isEmpty {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(alignment: .leading, spacing: 12) {
                        
                        ForEach(searchData.searchedUser, id: \.node_id) { user in
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text(user.login)
                                
                                Divider()
                            }
                            .padding(.horizontal)
                            // pagination...
                            // user reaches bottom then next results are fetched...
                            .onAppear {
                                // stopping search until 3rd page...
                                if user.node_id ==
                                    searchData.searchedUser.last?.node_id &&
                                    searchData.page <= 3 {
                                    
                                    searchData.page += 1
                                    searchData.find()
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                    .padding(.top)
                }
                .frame(height: 240)
            }
        }
        .background(Color(.gray))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding()
    }
}
