//
//  ListViewViewModel.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    let userId: String
    
    init(userId: String) {
        self.userId = userId
        print("ListViewViewModel initialized with userId: \(userId)") 
    }
     
    func delete(id: String) {
        guard !userId.isEmpty else {
            print("Error: userId is empty.")
            return
        }
        
        guard !id.isEmpty else {
            print("Error: Document ID is empty.")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete { error in
                if let error = error {
                    print("Error deleting document: \(error.localizedDescription)")
                } else {
                    print("Document successfully deleted")
                }
            }
    }
}
