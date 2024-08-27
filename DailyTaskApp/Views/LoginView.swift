//
//  LoginView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import SwiftUI

struct LoginView: View {
    
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300 , height: 300, alignment: .center)
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                TextField("E-mail", text: $viewModel.email)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal, 15)
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal, 15)
                    .autocapitalization(.none)
                Button(action: {
                    viewModel.login()
                }, label: {
                    Text("Login")
                        .font(.title)
                        .padding()
                        .bold()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                })
                
                Spacer()
                Text("Are you not registered ?")
                    .font(.headline)
                    .bold()
                    .frame(alignment: .center)
                NavigationLink("Sign in") {
                    RegisterView()
                }
                .font(.headline)
                .bold()
                .frame(alignment: .center)
                
                Spacer()
            }
            .navigationTitle("Login")
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LoginView()
}
