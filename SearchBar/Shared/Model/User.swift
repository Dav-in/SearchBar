//
//  User.swift
//  SearchBar
//
//  Created by Davin Henrik on 3/4/22.
//

import Foundation
import SwiftUI

struct User: Decodable {
    
    var node_id: String
    var login: String
    var avatar_url: String
}

struct Results: Decodable {
    var items: [User]
}
