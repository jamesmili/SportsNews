//
//  SearchView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var teams = Teams
    @ObservedObject var tweets: TweetsViewModel
    @State private var search = ""
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBarView(text: $search)
                List{
                    ForEach(Array(self.teams.keys).sorted().filter{$0.hasPrefix(search) || search == ""}, id: \.self){ key in
                        NavigationLink<Text, TeamTweetsView>(destination: TeamTweetsView(team: key, subreddit: self.teams[key]!, tweets: self.tweets)){
                            Text(key)
                        }
                    }
                }
            }
        .navigationBarTitle("Search")
        }
    }

}


