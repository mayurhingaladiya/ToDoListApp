//
//  Task.swift
//  ToDoListApp
//
//  Created by Mayur Hingaladiya on 11/02/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
    
}

let testDataTasks = [
    Task(title: "Implements the UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Profit!!", completed: false)
]
