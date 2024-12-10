//
//  ReadingDetailView.swift
//  WebReader
//
//  Created by Seedy on 29/11/2024.
//

import SwiftUI

struct ReadingDetailView: View {
    let reading: ReadingItem
    var body: some View {
        WebView(url: reading.url)
    }
}

#Preview {
    ReadingDetailView(reading: ReadingItem.example)
}
        
