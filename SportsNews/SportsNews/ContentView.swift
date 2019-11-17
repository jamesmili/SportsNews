//
//  ContentView.swift
//  SportsNews
//
//  Created by James Militante on 2019-10-03.
//  Copyright © 2019 James Militante. All rights reserved.
//

import SwiftUI
import UIKit
import WebKit
import RefreshUI

struct ContentView: View {
    @ObservedObject private var tweets = TweetsViewModel()
    @State private var selectedTab = 1
    @State var isLoading: Bool = false
    
    init(){
        self.tweets.updateNFL()
    }

    var body: some View {
        TabView{
            NavigationView{
                List{
                    ForEach(self.tweets.nba, id: \.id){ tweet in
                            NavView(tweet: tweet)
                    }
                }.onPull(perform: {
                    self.tweets.updateNBA()
                }, isLoading: isLoading)
                .navigationBarTitle(Text("NBA News"))
            }.onAppear{
                self.tweets.updateNBA()
            }.tabItem{
                Image("basketball")
                Text("NBA")
            }
            
            NavigationView{
                List{
                    ForEach(self.tweets.nfl, id: \.id){ tweet in
                            NavView(tweet: tweet)
                    }
                }.onPull(perform: {
                    self.tweets.updateNFL()
                }, isLoading: isLoading)
                .navigationBarTitle(Text("NFL News"))
            }.onAppear{
                    self.tweets.updateNFL()
            }.tabItem{
                Image("football")
                Text("NFL")
            }
        }
    }
}

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

struct PageView: View{
    let url: String

    var body: some View{
        WebView(request: URLRequest(url: URL(string: url)!))
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct WebView: UIViewRepresentable{
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context){
        uiView.load(request)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
