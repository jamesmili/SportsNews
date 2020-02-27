//
//  NBATweetsView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import SwiftUI
import RefreshUI

struct NBATweetsView: View {
    @ObservedObject var tweets: TweetsViewModel
    @State var isLoading = false
    
    var body: some View {
        NavigationView{
            List{
                if(self.tweets.nba.count == 0){
                    ForEach((1...11), id: \.self){ _ in
                        LoadingView(lines: 3)
                    }
                }else{
                    ForEach(self.tweets.nba, id: \.id){ tweet in
                            NavView(tweet: tweet)
                    }
                }
            }.onPull(perform: {
                self.tweets.updateNBA()
            }, isLoading: isLoading)
            .navigationBarTitle(Text("NBA News"))
        }
    }
}
