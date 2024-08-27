//
//  LoginViewViewModel.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    func login() {
        
        if validate() {
            return
        }
    }
    
    func validate () -> Bool {
        
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Tüm alanları doldurun"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage =  "Geçerli mail girin"
            return false
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        
        return true
        
    }
    
}
