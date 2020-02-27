//
//  Tweets.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-03.
//  Copyright © 2019 James Militante. All rights reserved.
//

import Foundation

struct Posts: Decodable{
    var data: Tweet
}

struct Tweet: Decodable{
    var children: [Child]
}

struct Child: Decodable{
    var data: ChildData
}

struct ChildData: Decodable, Identifiable{
    let title: String
    let url: String
    let id: String
    let created_utc: Double
}

