//
//  ContentView.swift
//  WebReader
//
//  Created by Seedy on 26/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    enum NavSelection: Identifiable, Hashable {
        case pdf(url: URL)
        case readingItem(reading: ReadingItem)
        var id: String{
            switch self {
            case .pdf(url: let url):
                return url.absoluteString
            case .readingItem(reading: let reading):
                return reading.id.uuidString
            }
        }
    }
    
    @State private var readingVioewModel = ReadingDataViewModel()
    @State private var selection: NavSelection? = nil
    @State private var isAddNewReadingItemViewPresented: Bool = false
    @Environment(\.scenePhase) var sceedPhase
    var body: some View {
        NavigationSplitView {
            List(selection: $selection){
                PDFListView()
                ReadingSectionView(readingViewModel: readingVioewModel)
            }
            .toolbar{
                Button {
                    isAddNewReadingItemViewPresented.toggle()
                } label: {
                    Label("Add to Reading List", systemImage: "plus")
                }
                EditButton()

            }
            .sheet(isPresented: $isAddNewReadingItemViewPresented) {
                ReadingItemEditorView(readingViewModel: readingVioewModel)
            }
        } detail: {
            if let selection {
                switch selection {
                case .pdf(let url):
                    PDFFileView(fileUrl: url)
                case .readingItem(let readingItem):
                    ReadingDetailView(readingViewModel: readingVioewModel, reading: readingItem)
                }
//                ReadingDetailView(readingViewModel: readingVioewModel, reading: selection)
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
