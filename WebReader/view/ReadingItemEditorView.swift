//
//  ReadingItemEditorView.swift
//  WebReader
//
//  Created by Seedy on 29/11/2024.
//

import SwiftUI

struct ReadingItemEditorView: View {
    @State var url: String = ""
    @State var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Add a new Item")
                .font(.title)
            TextField("URL", text: $url)
            TextField("Title", text: $title)
            
            HStack{
                Spacer()
                Button("Cancel"){
                    
                }
                .buttonStyle(.bordered)
                Button("Save"){
                    
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

#Preview {
    ReadingItemEditorView()
}
