//
//  WebViewStateModel.swift
//  WebReader
//
//  Created by Seedy on 10/12/2024.
//

import Foundation
import Observation

@Observable
class WebViewStateModel{
    var url: URL? = nil
    var isLoading: Bool = false
    var error: Error?
    var cureentURL: URL? = nil
    var currentTitle: String? = nil
    
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
}
