//
//  PDFViewModel.swift
//  WebReader
//
//  Created by Seedy on 18/12/2024.
//

import Foundation
import Observation

@Observable
class PDFViewModel{
    
    var pdfFiles: [URL] = []
    
    init(){
//        self.pdfFiles = pdfFiles
        loadPDFFiles()
    }
    
    func loadPDFFiles(){
        let directory = URL.documentsDirectory
        do{
            let fileUrls = try FileManager.default.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)
            // check for pdfs only
        }catch{}
    }
    
    func deletePDFFile(_ fileURL: URL){
        do{
            try FileManager.default.removeItem(at: fileURL)
        }catch{}
    }
    
}
