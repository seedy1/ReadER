//
//  ReadingDataViewModel.swift
//  WebReader
//
//  Created by Seedy on 29/11/2024.
//

import Foundation
import Observation

@Observable
class ReadingDataViewModel{
    var exampleList: [ReadingItem] = []
    
    func addNewReadingItem(title: String, urlString: String){
        guard let url = URL(string: urlString) else { return }
        addNewReadingItem(title: title, url: url)
    }
    
    func addNewReadingItem(title: String, url: URL){
        
        let readingItem = ReadingItem(title: title, url: url)
        exampleList.append(readingItem)
        saveData()
    }

    
    func saveData(){
        do{
            let data = try JSONEncoder().encode(exampleList)
            let url = fileURL()
            try data.write(to: url)
            
        }catch{
            print("saving to file errrrrr")
        }
    }

    func fileURL() -> URL{
//        let directory = URL.applicationDirectory
        let directory = supportDirectory() ?? URL.documentsDirectory
        return directory.appendingPathComponent("readingList.josn")
    }
    
    func supportDirectory() -> URL?{
        do{
            return try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        }catch{
            return nil
        }
    }
    
    func loadData(){
        let url = fileURL()
        do{
            let data = try Data(contentsOf: url)
            self.exampleList = try JSONDecoder().decode([ReadingItem].self, from: data)
        }catch{
            print("saving to file errrrrr")
            useSampleData()
            
        }
    }
    
    func useSampleData(){
        self.exampleList = ReadingItem.examples
    }
}
