//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Mayur Hingaladiya on 11/02/2023.
//

import SwiftUI
import Firebase


@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
      }
    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
