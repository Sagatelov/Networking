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
    
    func getAllPosts( complition: @escaping ([Posts]) -> Void) {
        
        guard let urlString = URL(string: url + "posts") else { return }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            if error != nil {
                print("DataTask error: " + "\(String(describing: error?.localizedDescription))" + "\n" )
            } else if let resp = response as? HTTPURLResponse,
                      resp.statusCode == 200, let data = data {
                print(response)
                let post = try? JSONDecoder().decode([Posts].self, from: data)
                
                complition(post ?? [])
            }
        }.resume()
    }
}
