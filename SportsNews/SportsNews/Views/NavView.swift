//
//  NavView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import SwiftUI

struct NavView: View{
    @State var tweet: TweetViewModel
    @State var showingTweet = false

    var body: some View{
        VStack{
            NavigationLink(destination: PageView(url: self.tweet.url)) {
                VStack(alignment: .leading,spacing: 12, content: {
                    Text(tweet.title)
                    .lineLimit(3)
                    Text(getTimeStamp(utc: tweet.utc))
                    .font(Font.custom("timestamp", size: 10))
                })
            }
        }
    }
}
