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
                .fill(Color("loading"))
                    .frame(height: 12)
            }
             RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(Color("loading"))
            .frame(width: 65, height: 10)
        }
    }
}
