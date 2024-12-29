//
//  MustApp.swift
//  Must
//
//  Created by Apple on 27.12.2024.
//

import SwiftUI

@main
struct MustApp: App {
    @StateObject private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(model: model)
                SelectSomethingView()
            }
        }
    }
}
