//
//  ContentView.swift
//  Must
//
//  Created by Apple on 27.12.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model: ViewModel
    @State private var editMode = EditMode.inactive
    @State private var selectedItems = Set<ToDoItem>()
    
    var body: some View {
        NavigationView {
            List(selection: $selectedItems) {
                ForEach(model.items) { item in
                    Label(item.title, systemImage: item.icon)
                        .tag(item)
                }
                .onDelete(perform: model.delete)
            }
            .navigationTitle("MustToDo")
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading, content: EditButton.init)
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: model.add) {
                        Label("New", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    if editMode == .active {
                        HStack{
                            Spacer()
                            
                            Button(role: .destructive) {
                                model.delete(selectedItems)
                                selectedItems.removeAll()
                            } label: {
                                Label("Delete Selected", systemImage: "trash")
                            }
                            .disabled(selectedItems.isEmpty)
                        }
                    }
                }
                .animation( .default, value: model.items)
                .listStyle( .sidebar)
                .environment(\.editMode, $editMode)
            }
        }
        
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView(model: ViewModel())
            }
        }
    }
}
