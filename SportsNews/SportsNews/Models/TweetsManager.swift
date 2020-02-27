//
//  TweetsManager.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-03.
//  Copyright © 2019 James Militante. All rights reserved.
//

//    func getPost(input: String) {
//        if let url = URL(string: "https://www.reddit.com/r/\(input)/search.json?q=url%3Atwitter&restrict_sr=on&sort=new&t=week"){
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error == nil {
//                    let decoder = JSONDecoder()
//                    if let safeData = data {
//                        do{
//                            let results = try decoder.decode(Posts.self, from: safeData)
//                            DispatchQueue.main.async {
//                                self.posts = results.data.children
//                            }
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//            task.resume()
//        }
//    }

import Foundation

class TweetsManager: ObservableObject{
    func getPost(sport: String, completion: @escaping([Child]?) -> ()) {
        guard let url = URL(string: "https://www.reddit.com/r/\(sport)/search.json?q=url%3Atwitter&restrict_sr=on&sort=new&t=week") else{
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
