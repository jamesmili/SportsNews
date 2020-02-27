//
//  TweetListView.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-30.
//  Copyright © 2019 James Militante. All rights reserved.
//

import Foundation

class TweetsViewModel: ObservableObject{
    @Published var nba = [TweetViewModel]()
    @Published var nfl = [TweetViewModel]()
    @Published var team = [TweetViewModel]()
    
    func updateNBA(){
        TweetsManager().getPost(sport: "nba") { tweet in
            if let tweet = tweet {
                self.nba = tweet.map(TweetViewModel.init)
            }
        }
    }
    
    func updateNFL(){
        TweetsManager().getPost(sport: "nfl") { tweet in
            if let tweet = tweet {
                self.nfl = tweet.map(TweetViewModel.init)
            }
        }
    }
    
    func updateTeam(team: String){
        TweetsManager().getPost(sport: team) { tweet in
            if let tweet = tweet {
                self.team = tweet.map(TweetViewModel.init)
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