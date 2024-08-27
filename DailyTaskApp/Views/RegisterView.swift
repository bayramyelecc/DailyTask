//
//  RegisterView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import SwiftUI

struct RegisterView: View {

    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300 , height: 300, alignment: .center)
                
                if !viewModel.errorMessages.isEmpty {
                    Text(viewModel.errorMessages)
                        .foregroundStyle(.red)
                }
                
                TextField("Full name", text: $viewModel.fullName)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal, 15)
                    .autocapitalization(.none)
                
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
                    viewModel.register()
                }, label: {
                    Text("Register")
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
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Register")
                        .font(.largeTitle)
                        .bold()
                }
            }
            
        }
    }
}


#Preview {
    RegisterView()
}
