//
//  PDFFileWrapperView.swift
//  WebReader
//
//  Created by Seedy on 18/12/2024.
//

import SwiftUI
import PDFKit

struct PDFFileWrapperView: UIViewRepresentable {
    
    let fileUrl: URL
    
    func makeUIView(context: Context) -> some PDFView {
//        PDFFileView()
        PDFView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.document = PDFDocument(url: fileUrl)
    }
}

//#Preview {
//    PDFFileWrapperView()
//}
