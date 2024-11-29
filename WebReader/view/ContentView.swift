//
//  ContentView.swift
//  WebReader
//
//  Created by Seedy on 26/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var readingVioewModel = ReadingDataViewModel()
    @State private var selection: ReadingItem? = nil
    var body: some View {
        NavigationSplitView {
            ReadingListView(readingViewModel: readingVioewModel, selection: $selection)
        } detail: {
            if let selection {
//                Text(selection.title)
                ReadingDetailView(reading: selection)
            }else{
                // Ipad only
                ContentUnavailableView("Select an item", systemImage: "book")
            }
        }

    }
}

#Preview {
    ContentView()
}
