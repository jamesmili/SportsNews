//
//  API.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-03.
//  Copyright © 2019 James Militante. All rights reserved.
//

import Foundation

struct Posts: Codable{
    var data: Tweet
}

struct Tweet: Codable{
    var children: [Child]
}

struct Child: Codable{
    var data: ChildData
}

struct ChildData: Codable{
    let title: String
    let url: String
    let id: String
    let created_utc: Double
}
