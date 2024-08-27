//
//  NewItemViewViewModel.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    
    @Published var txtHead = ""
    @Published var txtSub = ""
    @Published var selectedDate = Date()
    @Published var alertMessages = false
    
    init() {}
    
    func save() {
        
        guard canSave else {
            alertMessages = true // Kullanıcıya bir uyarı göstermek için
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            print("Error: User ID is nil.")
            return
        }
        
        let newItemId = UUID().uuidString
        let newItem = NewItem(id: newItemId, title: txtHead, subTitle: txtSub, dueDate: selectedDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItemId)
            .setData(newItem.asDictionary()) { error in
                if let error = error {
                    print("Error saving document: \(error.localizedDescription)")
                } else {
                    print("Document successfully saved")
                }
            }
    }
    
    var canSave: Bool {
        
        guard !txtHead.trimmingCharacters(in: .whitespaces).isEmpty,
              !txtSub.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard selectedDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
