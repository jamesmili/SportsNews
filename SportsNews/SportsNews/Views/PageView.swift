//
//  PageView.swift
//  SportsNews
//
//  Created by James Militante on 2020-02-26.
//  Copyright © 2020 James Militante. All rights reserved.
//

import SwiftUI
import UIKit
import WebKit

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
