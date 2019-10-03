//
//  NetworkingManager.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-03.
//  Copyright © 2019 James Militante. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import WebKit

class NetworkManager: ObservableObject{
    var didChange =  PassthroughSubject<NetworkManager, Never>()
    
    var resultList = [Child](){
        didSet{
            didChange.send(self)
        }
    }
    
    init(){
        guard let url = Foundation.URL(string: "https://www.reddit.com/r/nba/search.json?q=url%3Atwitter&restrict_sr=on&sort=new&t=week") else {return}
        
        URLSession.shared.dataTask(with: url) { (data,_,_) in
            guard let data = data else { return }
            
            let resultList = try! JSONDecoder().decode(API.self, from: data)
            DispatchQueue.main.async{
                self.resultList = resultList.data.children
                print(resultList)
                
            }
        }.resume()
    }
    
}
