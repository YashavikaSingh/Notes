//
//  CreateView.swift
//  Notes
//
//  Created by Yashavika Singh on 28.05.24.
//

 import SwiftUI
import CoreData

struct CreateToDoView: View{
    @Environment(\.dismiss) var dismiss
     @Environment(\.modelContext) var context
     
     @State private var item = ToDoItem()
     
     var body: some View {
         List {
             TextField("Name", text: $item.title)
             DatePicker("Choose a date", selection: $item.timestamp)
             Toggle("Important?", isOn: $item.isCritical)
             Button("Create") {
                 withAnimation {
                     context.insert(item)
                 }
                 dismiss()
             }
         }
         .navigationTitle("Create ToDo")
     }
 }
 #Preview {
     
     CreateToDoView().modelContainer(for: ToDoItem.self)
 }
