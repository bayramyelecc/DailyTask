//
//  FireStoreManager.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import Foundation

import FirebaseFirestore

class FireStoreManager {
    
    private let db = Firestore.firestore()
    
    
    func saveUser(user: User, completion: @escaping (Error?) -> Void){
        
        let userData: [String:Any] = [

            "email" : user.email,
            "kayıtTarihi" : Timestamp(date: user.dueDate)
        ]
        
        db.collection("users").document(user.id).setData(userData) { error in
            completion(error)
        }
        
    }
    
    func fetchUser(uid: String, completion: @escaping (User?, Error?) -> Void){
        
        db.collection("users").document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                let email = data?["email"] as? String ?? ""
                let dueDate = (data?["dueDate"] as? Timestamp)?.dateValue() ?? Date()
                let user = User(id: uid, name: "", email: email, password: "", dueDate: dueDate)
                completion(user, nil)
            } else {
                completion(nil, error)
            }
        }
        
    }
    
}
