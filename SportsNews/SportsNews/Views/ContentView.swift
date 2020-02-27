//
//  ContentView.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-03.
//  Copyright © 2019 James Militante. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @ObservedObject var tweets = TweetsViewModel()
    @State private var selectedTab = 1
    @State var alert = false

    var body: some View {
        TabView{
            NBATweetsView(tweets: tweets)
            .onAppear{
                self.tweets.updateNBA()
            }.tabItem{
                Image("basketball")
                Text("NBA")
            }
            
            NFLTweetsView(tweets: tweets)
            .onAppear{
                self.tweets.updateNFL()
            }.tabItem{
                Image("football")
                Text("NFL")
            }
            
            SearchView(tweets: tweets)
            .tabItem{
                Image("search")
                Text("Search")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
