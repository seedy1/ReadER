//
//  ReadingItemEditorView.swift
//  WebReader
//
//  Created by Seedy on 29/11/2024.
//

import SwiftUI

struct ReadingItemEditorView: View {
    @Bindable var readingViewModel: ReadingDataViewModel
    @State var url: String = ""
    @State var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Add a new Item")
                .font(.title)
            TextField("Title", text: $title)
            TextField("URL", text: $url)
                .textInputAutocapitalization(.never)
            
            HStack{
                Spacer()
                Button("Cancel"){
                    dismiss()
                }
                .buttonStyle(.bordered)
                Button("Save"){
                    readingViewModel.addNewReadingItem(title: title, urlString: url)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

#Preview {
    ReadingItemEditorView(readingViewModel: ReadingDataViewModel())
}
