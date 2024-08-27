//
//  ContentView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject private var viewModel = MainViewViewModel()

    var body: some View {
        VStack {
            if viewModel.isSignedIn, !viewModel.currenUserId.isEmpty {
                MainView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            viewModel.checkCurrentUser() 
        }
    }
}

#Preview {
    ContentView()
}
