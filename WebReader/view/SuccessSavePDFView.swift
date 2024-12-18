//
//  SuccessSavePDFView.swift
//  WebReader
//
//  Created by Seedy on 18/12/2024.
//

import SwiftUI

struct SuccessSavePDFView: View {
    let url: URL
    var body: some View {
        Label("Saved file to \(url.lastPathComponent)", systemImage: "square.and.arrow.down.badge.checkmark.fill")
            .background(Color.green)
            .foregroundColor(Color.white)
            .padding()
            .cornerRadius(5)
            .padding(.bottom, 0)
            .frame(maxWidth: .infinity, alignment: .bottom)
    }
}

#Preview {
    SuccessSavePDFView(url: URL(string: "//Use/Your/Path/here.pdf")!)
}
