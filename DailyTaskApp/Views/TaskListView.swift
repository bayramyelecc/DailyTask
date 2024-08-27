//
//  ListView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import SwiftUI
import FirebaseFirestore

struct TaskListView: View {
    @StateObject var viewModel: ListViewViewModel
    @FirestoreQuery private var items: [NewItem]
    
    init(userId: String) {
        self._viewModel = StateObject(wrappedValue: ListViewViewModel(userId: userId))
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.userId.isEmpty {
                    Text("Kullanıcı ID bulunamadı. Lütfen giriş yapın.")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(items) { item in
                        ItemView(item: item)
                            .swipeActions {
                                Button(action: {
                                    viewModel.delete(id: item.id)
                                }) {
                                    Text("Delete")
                                        .background(.red)
                                }
                            }
                    }
                    .listStyle(PlainListStyle())
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.showingNewItemView = true
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.black)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    .sheet(isPresented: $viewModel.showingNewItemView) {
                        NewItemView(newItemPresented: $viewModel.showingNewItemView)
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    TaskListView(userId: "KStI82Ns6mRsuVLzkfm0rBme8B53") 
}
