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
    @Environment(\.scenePhase) var sceedPhase
    var body: some View {
        NavigationSplitView {
            ReadingListView(readingViewModel: readingVioewModel, selection: $selection)
        } detail: {
            if let selection {
                ReadingDetailView(reading: selection)
            }else{
                // Ipad only
                ContentUnavailableView("Select an item", systemImage: "book")
            }
        }
        
        .onChange(of: sceedPhase){ _, phase in
            switch phase {
            case .active:
                readingVioewModel.loadData()
            case .inactive, .background:
                readingVioewModel.saveData()
            @unknown default:
                break
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
