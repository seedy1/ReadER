//
//  WebView.swift
//  WebReader
//
//  Created by Seedy on 09/12/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    let url: URL
    
    func makeUIView(context: Context) -> some WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: url))
        return view
    }
    
    // big screens
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let currentURL = uiView.url, currentURL != url{
            uiView.load(URLRequest(url: url))
        }else{
            uiView.load(URLRequest(url: url))
        }
        
    }
    
}

#Preview {
    WebView(url: URL(string: "https://www.apple.fr")!)
}
