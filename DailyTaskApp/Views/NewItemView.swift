//
//  NewItemView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import SwiftUI

struct NewItemView: View {
    
    @Binding var newItemPresented: Bool
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    @State var isActive = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                
                TextField("Add a task..", text: $viewModel.txtHead)
                    .padding()
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding()
                    .font(.headline)
                    .bold()
                
                TextEditor(text: $viewModel.txtSub)
                    .padding()
                    .border(Color.gray.opacity(0.1), width: 4)
                    .cornerRadius(10)
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .cornerRadius(3)
                    .padding(.horizontal, 15)
                
                DatePicker("Select a date", selection: $viewModel.selectedDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                
                Button(action: {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.alertMessages = true
                    }
                    
                    
                    
                }, label: {
                    Text("Save")
                        .font(.title)
                        .padding()
                        .bold()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                        
                })
                .navigationDestination(isPresented: $isActive) {
                    MainView()
                }
                .alert(isPresented: $viewModel.alertMessages, content: {
                    Alert(title: Text("HATA"), message: Text("Lütfen verileri kontrol edin."))
                })
                
                Spacer()
            }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
