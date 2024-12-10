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
        let directory = URL.applicationDirectory
        return directory.appendingPathComponent("readingList.josn")
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
