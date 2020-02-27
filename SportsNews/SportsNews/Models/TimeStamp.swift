//
//  TimeStamp.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import Foundation

func getTimeStamp(utc: Double) -> String{
    let currentDate = Date()
    let epochDate = currentDate.timeIntervalSince1970
    let timeDiff = Int(abs(Double(epochDate - utc)))
    let minutes = timeDiff/60
    let hours = minutes/60
    let days = hours/24
    if (days > 0){
        if (days == 1){
            return "\(days) day ago"
        }else{
            return "\(days) days ago"
        }
    }else if (hours > 0){
        if (hours == 1){
            return "\(hours) hour ago"
        }else{
            return "\(hours) hours ago"
        }
    }else if (minutes > 0){
        if (minutes == 1){
            return "\(minutes) minute ago"
        }else{
            return "\(minutes) minutes ago"
        }
    }else{
        return "Just Now."
    }
}
