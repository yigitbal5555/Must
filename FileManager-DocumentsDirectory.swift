//
//  FileManager-DocumentsDirectory.swift
//  Must
//
//  Created by Apple on 27.12.2024.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
