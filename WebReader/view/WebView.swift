//
//  WebView.swift
//  WebReader
//
//  Created by Seedy on 09/12/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable{
    
    @Bindable var webViewState: WebViewStateModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
//    let url: URL
//    @Binding var isLoading: Bool
    
    func makeUIView(context: Context) -> some WKWebView {
        let view = WKWebView()
//        view.load(URLRequest(url: url))
        load(view)
        view.navigationDelegate = context.coordinator
        return view
    }
    
    // big screens
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let url = webViewState.url else { return }
        if uiView.url == nil{
            load(uiView)
        }else if uiView.url != nil{
            load(uiView)
        }
    }
    
    func load(_ uiView: WKWebView){
        guard let url = webViewState.url else { return }
        uiView.load(URLRequest(url: url))
        webViewState.update(isLoading: true)
//        isLoading = true
    }
    
    class Coordinator: NSObject, WKNavigationDelegate{
        var parent: WebView
        init(parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.webViewState.update(isLoading: true)
        }
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.webViewState.update(isLoading: false)
            parent.webViewState.update(currentURL: webView.url, currentTitle: webView.title)
        }
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
            parent.webViewState.update(isLoading: true, error: error)
        }
    }
    
}

#Preview {
    @State @Previewable var isLoading = false
    WebView(webViewState: WebViewStateModel(url: URL(string: "https://www.apple.fr")!))
}
