//
//  RegisterViewViewModel.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel : ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessages = ""
    
    init(){}
    
    func register(){
        
        if validate() {
            return
        }
        
    }
    
    private func insertUserRecord(id: String){
        
        let newUser = User(id: id, name: fullName, email: email, dueDate: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    
    func validate() -> Bool{
        
        errorMessages = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty, !fullName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessages = "Lütfen tüm alanları doldurun"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessages = "Geçerli bir mail girin"
            return false
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
            
        }
        
        
        return true
    }
    
}
