//
//  MainView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewViewModel()
    
    var body: some View {
        NavigationStack {
            TabView {
                if viewModel.currenUserId.isEmpty {
                    Text("Kullanıcı ID bulunamadı. Lütfen giriş yapın.")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    TaskListView(userId: viewModel.currenUserId)
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("Tasks")
                        }
                }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
            .navigationTitle("Daily Task")
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    MainView()
}
