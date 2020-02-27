//
//  LoadingView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import SwiftUI

struct LoadingView: View{
    private var lines: Int
    
    init(lines: Int){
        self.lines = lines
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach((1...self.lines), id: \.self){_ in
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color(red: 175/255, green: 175/255, blue: 175/255))
                    .frame(height: 12)
            }
             RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(Color(red: 195/255, green: 195/255, blue: 195/255))
            .frame(width: 65, height: 10)
        }
    }
}
