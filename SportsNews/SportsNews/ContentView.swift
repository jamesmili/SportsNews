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
    
    var body: some View {
        NavigationView{
            TabView{
                List(self.tweets.nba, id: \.id){ tweet in
                    NavigationLink(destination: PageView(url: tweet.url)){
                        Text(tweet.title)
                    }
                }.tabItem{
                    Text("NBA")
                    .bold()
                }.tag(0)
                
                List(self.tweets.nfl, id: \.id){ tweet in
                    NavigationLink(destination: PageView(url: tweet.url)){
                        Text(tweet.title)
                    }
                }.tabItem{
                    Text("NFL")
                }.tag(1)
            }
            .navigationBarTitle(Text("News this week"))
        }
    }
}

struct PageView: View{
    let url: String
    var body: some View{
        WebView(request: URLRequest(url: URL(string: url)!))
        .navigationBarTitle("Tweet")
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
