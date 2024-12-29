//
//  ToDoItem.swift
//  Must
//
//  Created by Apple on 27.12.2024.
//

import Foundation

struct ToDoItem: Codable, Hashable, Identifiable {
    enum Priority: String, Codable, CaseIterable {
        case Low = "Low"
        case Medium = "Medium"
        case High = "High"
    }
    
    var id = UUID()
    var title = "New Title Add"
    var priority = Priority.Medium
    var isComplete = false
    
    var icon: String {
        if isComplete {
            return "checkmark.square"
        } else {
            switch priority {
            case .Low:
                return "arrow.down.square"
            case .Medium:
                return "square"
            default:
                return "exclamationmark.square"
            }
        }
    }
    static let example = ToDoItem()
}
