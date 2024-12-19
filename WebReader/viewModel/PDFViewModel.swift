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
            self.pdfFiles = fileUrls.filter{$0.pathExtension == "pdf"} // check for pdfs only
        }catch{
            print("cannot load pdf files")
        }
    }
    
    func deletePDFFile(_ fileURL: URL){
        do{
            try FileManager.default.removeItem(at: fileURL)
        }catch{}
    }
    
}
