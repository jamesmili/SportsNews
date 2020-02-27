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
    @State private var search = ""
    
    var body: some View {
        VStack{
            SearchBarView(searchText: $search)
            List{
                ForEach(Array(self.teams.keys).sorted().filter{$0.hasPrefix(search) || search == "" }, id: \.self){ key in
                    NavigationLink(destination: TweetsView(content: key, subreddit: self.teams[key]!)){
                        Text(key)
                        .foregroundColor(Color("text"))
                    }.listRowBackground(Color("tweetsBackground"))
                }
            }
        }
        .navigationBarTitle("Search")
        .background(Color("navBackground"))
        .onAppear{
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

