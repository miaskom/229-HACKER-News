//
//  WebView.swift
//  HACKER News
//
//  Created by Marcin Miasko on 01/07/2020.
//  Copyright © 2020 Marcin Miasko. All rights reserved.
//

import SwiftUI
import WebKit  //potrzebny dla naszego WebView

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)  //uiView z agrumentu funkcji updateUIview
            }
        } //if let safeString
    } //func
} //struct
