//
//  ProfileView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init(){}
    
    var body: some View {
        NavigationStack{
            VStack{
                
                if let user = viewModel.user{
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 125, height: 125)
                    
                    VStack{
                        HStack{
                            Text("Name:")
                            Text(user.name)
                        }
                        HStack{
                            Text("E-mail:")
                            Text(user.email)
                        }
                        HStack{
                            Text("Kayıt tarihi:")
                            Text("\(Date(timeIntervalSince1970: user.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        }
                        
                    }
                } else {
                    Text("Profil yükleniyor...")
                }
                
                
                Button(action: {
                    viewModel.logout()
                }, label: {
                    Text("Çıkış Yap")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                        .bold()
                })
            }
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
