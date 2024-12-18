//
//  PDFListView.swift
//  WebReader
//
//  Created by Seedy on 18/12/2024.
//

import SwiftUI

struct PDFListView: View {
    @State private var pdfModel = PDFViewModel()
    @State private var isExpanded: Bool = false
    var body: some View {
        Section("PD Files", isExpanded: $isExpanded) {
            ForEach(pdfModel.pdfFiles, id: \.self) { file in
                Text(file.lastPathComponent)
                    .lineLimit(1)
            }
        }
    }
}

#Preview {
    List{
        PDFListView()
    }
}
