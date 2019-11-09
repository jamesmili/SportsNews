//
//  TweetsManager.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-03.
//  Copyright © 2019 James Militante. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import WebKit

class TweetsManager: ObservableObject{
    func getNBAPost(completion: @escaping([Child]?) -> ()) {
        guard let url = URL(string: "https://www.reddit.com/r/nba/search.json?q=url%3Atwitter&restrict_sr=on&sort=new&t=week") else{
            fatalError("Ivalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode(Posts.self, from: data)
            DispatchQueue.main.async {
                completion(posts?.data.children)
            }
        }.resume()
    }
    
    func getNFLPost(completion: @escaping([Child]?) -> ()) {
        guard let url = URL(string: "https://www.reddit.com/r/nfl/search.json?q=url%3Atwitter&restrict_sr=on&sort=new&t=week") else{
            fatalError("Ivalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let posts = try? JSONDecoder().decode(Posts.self, from: data)
            DispatchQueue.main.async {
                completion(posts?.data.children)
            }
        }.resume()
    }
}
