//
//  SearchUsers.swift
//  SearchBar
//
//  Created by Davin Henrik on 3/4/22.
//

import Foundation
import SwiftUI

class SearchUser: ObservableObject {
    
    @Published var searchedUser: [User] = []
    
    //User query...
    @Published var query = ""
    
    //Current Result Page...
    @Published var page = 1
    
    func find() {
        
        //removing spaces...
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        
        let url = "https://api.github.com/search/users?q=\(searchQuery)&page=\(page)&per_page=10"
//    let url = "https://api.github.com/search/users?q=facebook&page=2&per_page=10"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard let jsonData = data else {
                print("No data found")
                return
                
            }
            // decoding api data...
            do {
                let users = try JSONDecoder().decode(Results.self, from: jsonData)
                //appending to searched users
                DispatchQueue.main.async {
                    
                    // remove data if its a new request...
                    if self.page == 1 {
                        self.searchedUser.removeAll()
                    }
                    
                    self.searchedUser.append(contentsOf: users.items)

                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
            .resume()
    }
}
