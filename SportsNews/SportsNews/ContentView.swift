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

struct ContentView: View {
    @ObservedObject private var tweets = TweetsViewModel()
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab){
            NavigationView{
                List(self.tweets.nba, id: \.id){ tweet in
                    NavView(tweet: tweet)
                    }
                .navigationBarTitle(Text("NBA News"))
            }.tabItem{
                Image("basketball")
                Text("NBA")
            }.tag(1)
            
            NavigationView{
                List(self.tweets.nfl, id: \.id){ tweet in
                    NavView(tweet: tweet)
                }
                .navigationBarTitle(Text("NFL News"))
            }.tabItem{
                Image("football")
                Text("NFL")
            }.tag(2)
        }
        
    }
}

struct NavView: View{
    @State var showDetail: Bool = false
    @State var tweet: TweetViewModel
    @State var showingTweet = false

    var body: some View{
        VStack{
            Button(action: { self.showingTweet.toggle() }) {
            VStack(alignment: .leading,spacing: 12 ,content: {
                Text(tweet.title)
                .lineLimit(10)
                Text(getTimeStamp(utc: tweet.utc))
                .font(Font.custom("timestamp", size: 10))
            })
            }
        }.sheet(isPresented: $showingTweet){
            PageView(url: self.tweet.url)
        }
    }
}

struct PageView: View{
    let url: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View{
        VStack(alignment: .leading){
            Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                HStack{
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
            .padding(.leading, 12)
            .padding(.top, 12)
            WebView(request: URLRequest(url: URL(string: url)!))
        }
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
