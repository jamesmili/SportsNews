//
//  NFLTweetsView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import Foundation
import SwiftUI
import RefreshUI

struct NFLTweetsView: View {
    @ObservedObject var tweets: TweetsViewModel
    @State var isLoading = false
    
    var body: some View {
        NavigationView{
            List{
                if(self.tweets.nfl.count == 0){
                    ForEach((1...11), id: \.self){ _ in
                        LoadingView(lines: 3)
                    }
                }else{
                    ForEach(self.tweets.nfl, id: \.id){ tweet in
                            NavView(tweet: tweet)
                    }
                }
            }.onPull(perform: {
                self.tweets.updateNBA()
            }, isLoading: isLoading)
            .navigationBarTitle(Text("NFL News"))
        }
    }
}
