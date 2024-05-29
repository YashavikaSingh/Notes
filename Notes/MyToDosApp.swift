//
//  NotesApp.swift
//  Notes
//
//  Created by Yashavika Singh on 28.05.24.
//

import SwiftUI
import SwiftData

@main
struct MyToDosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
