//
//  ReadingDetailView.swift
//  WebReader
//
//  Created by Seedy on 29/11/2024.
//

import SwiftUI

struct ReadingDetailView: View {
    @Bindable var readingViewModel: ReadingDataViewModel
    let reading: ReadingItem
//    @State var isLoading: Bool = false
    @State private var webViewState = WebViewStateModel()
    var body: some View {
        ZStack{
            WebView(webViewState: webViewState)
            if webViewState.isLoading {
                ProgressView().controlSize(.extraLarge)
            }else if let error = webViewState.error{
                Text(error.localizedDescription)
            }
        }
        .onChange(of: reading) { oldValue, newValue in
//            webViewState.url = newValue.url
            webViewState.updateOpenNew(newValue.url)
        }
        .onAppear {
//            webViewState.url = reading.url
            webViewState.updateOpenNew(reading.url)

        }
        .toolbar {
            if let newURL = webViewState.cureentURL, webViewState.url != newURL{
                Button("Add page to reading list"){
                    readingViewModel.addNewReadingItem(title: webViewState.currentTitle ?? "titre", url: newURL)
                }
//            }
        }
    }
}

#Preview {
    ReadingDetailView(readingViewModel: ReadingDataViewModel(), reading: ReadingItem.example )
}
        
