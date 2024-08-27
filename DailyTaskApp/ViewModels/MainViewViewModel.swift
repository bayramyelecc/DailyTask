//
//  ManiViewViewModel.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currenUserId: String = ""
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?

    init() {
        checkCurrentUser()
        authStateListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currenUserId = user?.uid ?? ""
            }
        }
    }

    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    func checkCurrentUser() {
        // Kullanıcı ID'sini güncelle
        DispatchQueue.main.async {
            self.currenUserId = Auth.auth().currentUser?.uid ?? ""
        }
    }

    deinit {
        if let handle = authStateListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
