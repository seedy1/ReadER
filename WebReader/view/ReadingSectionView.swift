//
//  ReadingListView.swift
//  WebReader
//
//  Created by Seedy on 29/11/2024.
//

import SwiftUI

struct ReadingSectionView: View {
    
//    let exampleList: [ReadingItem]
    @Bindable var readingViewModel: ReadingDataViewModel
//    @Binding var selection: ReadingItem?
//    @State private var isAddNewReadingItemViewPresented: Bool = false
    
    var body: some View {
//        Text("Hello, World!")
        Section("Reading List") {
            
            
            ForEach($readingViewModel.exampleList, editActions: [.move, .delete]) { $item in
                ReadingItemRow(readingItem: item)
                    .tag(ContentView.NavSelection.readingItem(reading: item))
                    .swipeActions(edge: .leading) {
                        Button("E") {
                            item.isRead.toggle()
                        }
                    }
            }
        }
    }

}

fileprivate struct ReadingItemRow: View {
    let readingItem: ReadingItem
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: readingItem.isRead ? "checkmark.circle.fill" : "book")
                .foregroundStyle(.green)
            VStack(alignment: .leading){
                Text(readingItem.title)
                Text(readingItem.creationDate.formatted(.dateTime))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        
    }
        
}

#Preview {
    @State @Previewable var selection: ReadingItem?
    NavigationStack{
        List{
            ReadingSectionView(readingViewModel: ReadingDataViewModel())
        }
    }
}
