//
//  TweetListView.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-30.
//  Copyright © 2019 James Militante. All rights reserved.
//

import Foundation

class TweetsViewModel: ObservableObject{
    @Published var posts = [TweetViewModel]()
    
    func updatePosts(content: String){
        TweetsManager().getPost(sport: content) { tweet in
            if let tweet = tweet {
                self.posts = tweet.map(TweetViewModel.init)
            }
        }
    }
}
//models for individual tweets
struct TweetViewModel: Identifiable{
    var tweet: Child
    init(tweet: Child){
        self.tweet = tweet
    }
    var id: String{
        return self.tweet.data.id
    }
    var title: String{
        return self.tweet.data.title
    }
    
    var url: String{
        return self.tweet.data.url
    }
    var utc: Double{
        return self.tweet.data.created_utc
    }
}
