//
//  TeamTweetsView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import SwiftUI

struct TeamTweetsView: View {
    @State var team: String
    @State var subreddit: String
    @ObservedObject var tweets: TweetsViewModel
    @State var isLoading = false
    
    var body: some View {
        List{
            if(self.tweets.team.count == 0){
                ForEach((1...11), id: \.self){ _ in
                    LoadingView(lines: 3)
                }
            }else{
                ForEach(self.tweets.team, id: \.id){ tweet in
                        NavView(tweet: tweet)
                }
            }
        }.onPull(perform: {
            self.tweets.updateTeam(team: self.subreddit)
        }, isLoading: isLoading)
            .navigationBarTitle(Text(self.team))
        .onAppear{
            self.tweets.updateTeam(team: self.subreddit)
            print(self.tweets.team)
        }
    }
}

