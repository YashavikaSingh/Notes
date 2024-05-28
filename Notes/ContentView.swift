//
//  ContentView.swift
//  Notes
//
//  Created by Yashavika Singh on 28.05.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showCreate = false
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
            
                .toolbar{
                    ToolbarItem{
                        Button(action: {
                            showCreate.toggle()
                        }, label: { Label("Add item", systemImage: "plus")
                        })
                    }
                }
                .sheet(isPresented: $showCreate, content: {
                    NavigationStack{
                        CreateToDoView()
                    }
                    .presentationDetents([.medium])
                })
                
        }
    }
}

#Preview {
    ContentView()
}
