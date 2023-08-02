//
//  Posts.swift
//  Networking
//
//  Created by Andrew Sagatelov on 26.07.2023.
//

import Foundation

class Posts: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
    init(userId: Int, title: String, body: String ) {
        self.userId = userId
        self.title = title
        self.body = body
        self.id = 0
        
    }
}
