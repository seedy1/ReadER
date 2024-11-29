//
//  ReadingItem.swift
//  WebReader
//
//  Created by Seedy on 26/11/2024.
//

import Foundation
import Observation

@Observable
class ReadingItem: Identifiable, Hashable, Equatable, Codable{
    let id: UUID
    var title: String
    var url: URL
    let creationDate: Date // date should not change
    var isRead: Bool
    
    init(id: UUID = UUID(), title: String, url: URL, creationDate: Date = Date(), isRead: Bool = false) {
        self.id = id
        self.title = title
        self.url = url
        self.creationDate = creationDate
        self.isRead = isRead
    }
    
    static func ==(l: ReadingItem, r: ReadingItem) -> Bool {
        l.id == r.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: preview helper
    static var example: ReadingItem {
        ReadingItem(title: "Apple", url: URL(string: "https://apple.com")!)
    }
    
    static var examples: [ReadingItem] {
        [.example,
         example,
         ReadingItem(title: "GooG", url: URL(string: "https://google.com")!, isRead: true),

        ]
    }
    
}
