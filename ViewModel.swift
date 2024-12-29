//
//  ViewModel.swift
//  Must
//
//  Created by Apple on 27.12.2024.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var items : [ToDoItem] {
        didSet {
            save()
        }
    }
    private let savePath =
    FileManager.documentsDirectory.appendingPathComponent("SaveItems")
    
    init() {
        do
        { let data = try Data(contentsOf: savePath)
            items = try JSONDecoder().decode([ToDoItem].self, from: data)
        } catch {
            items = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection]) }
        catch {
            print("unable to save data")
        }
    }
    func add() {
        let newItem = ToDoItem()
        items.append(newItem)
    }
    
    func delete(_ offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
    func delete(_ selected: Set<ToDoItem>){
        items.removeAll(where: selected.contains)
    }
}
