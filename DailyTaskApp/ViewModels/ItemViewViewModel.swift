//
//  ItemViewViewModel.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 26.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ItemViewViewModel: ObservableObject {
    
    func toggleIsDone(item: NewItem) {
        var updatedItem = item
        updatedItem.setDone(!item.isDone) 
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Error: User ID is nil.")
            return
        }
        
        guard !item.id.isEmpty else {
            print("Error: Item ID is empty.")
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(updatedItem.asDictionary()) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated")
                }
            }
    }
}
