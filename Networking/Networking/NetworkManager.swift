//
//  NetworkManager.swift
//  Networking
//
//  Created by Andrew Sagatelov on 26.07.2023.
//

import Foundation

class NetworkManager {
    
    enum requestType: String {
        case GET
        case POST
        case PUT
        case DELITE
    }
    
    var url = "https://jsonplaceholder.typicode.com/"
}
