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
    
    enum APis: String {
        case posts
        case comments
        case users
    }
    
    var url = "https://jsonplaceholder.typicode.com/"
    
    func getAllPosts( complition: @escaping ([Posts]) -> Void) {
        
        guard let urlString = URL(string: url + APis.posts.rawValue) else { return }
        
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            if error != nil {
                print("DataTask error: " + String(describing: error?.localizedDescription) + "\n" )
            } else if let resp = response as? HTTPURLResponse,
                      resp.statusCode == 200, let data = data {
                print(response)
                let post = try? JSONDecoder().decode([Posts].self, from: data)
                
                complition(post ?? [])
            }
        }.resume()
    }
    
    func loadPosts(_ post: [Posts], complitionHandler: @escaping () -> Void) {
        
        guard let url = URL(string: url + APis.posts.rawValue),
        let data = try? JSONEncoder().encode(post) else { return }
        
        var requst = URLRequest(url: url)
        requst.httpMethod = requestType.POST.rawValue
        requst.httpBody = data
        requst.setValue("\(data.count)", forHTTPHeaderField: "Content - Lengh")
        requst.setValue("application/json", forHTTPHeaderField: "Content - Type")
        
        URLSession.shared.dataTask(with: requst) { data, response, error in
            if error != nil {
                print("DataTask error" + String(describing: error?.localizedDescription) + "\n")
            } else if let response = response as? HTTPURLResponse,
                        response.statusCode == 201,
                      let responseData = data {
                let json = try! JSONSerialization.jsonObject(with: responseData)
                
                print(json)
                complitionHandler()
            }
        }
    }
}
