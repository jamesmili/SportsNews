//
//  TweetsView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import SwiftUI
import RefreshUI

struct TweetsView: View {
    @State var content: String
    @State var subreddit: String
    @ObservedObject var tweets = TweetsViewModel()
    @State var isLoading = false
    
    var body: some View {
        List{
            if(self.tweets.posts.count == 0){
                ForEach((1...11), id: \.self){ _ in
                    LoadingView(lines: 3)
                    .listRowBackground(Color("tweetsBackground"))
                }
            }else{
                ForEach(self.tweets.posts, id: \.id){ tweet in
                    NavView(tweet: tweet)
                    .listRowBackground(Color("tweetsBackground"))
                }
            }
        }.onPull(perform: {
            self.tweets.updatePosts(content: self.subreddit)
        }, isLoading: isLoading)
        .navigationBarTitle(self.content)
        .onAppear{
            self.tweets.updatePosts(content: self.subreddit)
        }
    }
}
