//
//  SelectSomethingView.swift
//  Must
//
//  Created by Apple on 29.12.2024.
//

import SwiftUI

struct SelectSomethingView: View {
    var body: some View {
        VStack(spacing:10){
            Image(systemName: "checkmark.square")
                .font(.largeTitle)
                .foregroundColor(.accentColor)
            
            Text("Welcome to Such a Great Must To Do App")
                .font(.title)
            
            Text("Please Select an Item to view.")
        }
        
    }
}

#Preview {
    SelectSomethingView()
}
