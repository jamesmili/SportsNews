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
    @State private var selectedTab = 1
    @State var alert = false
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(named: "tweetsBackground")
        UITableView.appearance().tableFooterView = UIView()
        UITableViewCell.appearance().backgroundColor = UIColor(named: "tweetsBackground")
        let selectionColor = UIView()
        selectionColor.backgroundColor = UIColor(named: "selected")
        UITableViewCell.appearance().selectedBackgroundView = selectionColor
    }
    
    var body: some View {
        ZStack {
           Color("navBackground").edgesIgnoringSafeArea(.all)
           TabView{
               NavigationView{
                   TweetsView(content: "NBA", subreddit: "nba")
               }
               .tabItem{
                   Image("basketball")
                   Text("NBA")
               }
               NavigationView{
                   TweetsView(content: "NFL", subreddit: "nfl")
               }
               .tabItem{
                   Image("football")
                   Text("NFL")
               }
               NavigationView{
                   SearchView()
               }
               .tabItem{
                   Image("search")
                   Text("Search")
               }
           }.background(Color("navBackground"))
        }
    }
}

extension UINavigationController{
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = UIColor(named: "navBackground")
        standardAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "text")!]
        standardAppearance.shadowColor = .clear
        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = UIColor(named: "navBackground")
        scrollEdgeAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "text")!]
        scrollEdgeAppearance.shadowColor = .clear
        
        navigationBar.standardAppearance = standardAppearance
        navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        navigationBar.tintColor = .white
    }
}

extension UITabBarController{
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = UIColor(named: "tabBar")
        standardAppearance.shadowColor = .clear
        tabBar.standardAppearance = standardAppearance
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
