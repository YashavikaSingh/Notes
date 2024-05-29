//
//  ContentView.swift
//  Notes
//
//  Created by Yashavika Singh on 28.05.24.
//

import SwiftUI
import SwiftData


 struct ContentView: View {
    @Environment(\.modelContext) var context
     @State private var toDoEdit: ToDoItem?
     @Query(
        sort: \ToDoItem.timestamp,
        order: .reverse
     ) private var items: [ToDoItem]
    @State private var showCreate = false
    var body: some View {
        NavigationStack {
            
            
            List{
                ForEach(items){ item in
                        HStack{
                            VStack(alignment: .leading){
                                if item.isCritical{
                                    Image(systemName: "exclamationmark.3")
                                }
                                
                                Text(item.title)
                                Text("\(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .shortened))")
                            }
                            
                            Spacer()
                            Button{
                            item.isCompleted.toggle()
                                
                            } label:
                            {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(item.isCompleted ? .green : .gray)
                                
                            }
                        }
                        .swipeActions{
                            Button(role: .destructive){
                                withAnimation{
                                    context.delete(item)
                                }
                            } label: {Label("Delete", systemImage: "trash").symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            }
                            
                            Button{
                                
                                toDoEdit = item
                                
                            } label: {Label("Edit", systemImage: "pencil")
                            }.tint(.orange)
                            
                            
                        }
                }
            }
            .navigationTitle("To Do List")
            
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
                .sheet(item: $toDoEdit){
                    toDoEdit = nil;
                }
        
        content:{ item in UpdateToDoView(item: item)
        }
        }
    }
}

#Preview {
    ContentView().modelContainer(for: ToDoItem.self)
}
