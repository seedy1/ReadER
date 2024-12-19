//
//  PDFFileView.swift
//  WebReader
//
//  Created by Seedy on 18/12/2024.
//

import SwiftUI

struct PDFFileView: View {
    let fileUrl: URL
    var body: some View {
        PDFFileWrapperView(fileUrl: fileUrl)
            .toolbar {
                ShareLink(item: fileUrl)
            }
    }
}

#Preview {
    NavigationStack{
        PDFFileView(fileUrl: URL(string: "//localhost/path/to/file.pdf")!)
    }
}
