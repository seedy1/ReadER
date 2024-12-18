//
//  WebViewStateModel.swift
//  WebReader
//
//  Created by Seedy on 10/12/2024.
//

import Foundation
import Observation
import WebKit

@Observable
class WebViewStateModel{
    var url: URL? = nil
    var isLoading: Bool = false
    var error: Error?
    var cureentURL: URL? = nil
    var currentTitle: String? = nil
    weak var webView: WKWebView?
    var successSave: URL? = nil
    
    init(url: URL? = nil) {
        self.url = url
    }
    
    func update(isLoading: Bool, error: Error? = nil){
        self.isLoading = isLoading
        self.error = error
    }
    
    func updateOpenNew(_ url: URL){
        self.url = url
        self.error = nil
        self.cureentURL = nil
    }
    
    func update(currentURL: URL?, currentTitle: String?){
        self.cureentURL = currentURL
        self.currentTitle = currentTitle
    }
    
    // creates pdf from current web view page
    func saveToPDF(){
        guard let webView else { return }
        
        webView.createPDF { result in
            switch result {
            case .success(let data):
                print("PDF saved to \(data)")
                self.saveToPDF()
            case .failure(let error):
                print("Error saving PDF: \(error)")
            }
        }
    }
    
    func saveToDisk(_ data: Data){
        let documentURL = URL.documentsDirectory
        let title = currentTitle ?? "untitled"
        let fileUrl = documentURL.appendingPathComponent("\(title).pdf")
        do{
            try data.write(to: fileUrl)
            self.successSave = fileUrl
        }catch{
            
        }
    }
}
