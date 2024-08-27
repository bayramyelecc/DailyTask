//
//  ItemView.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 26.08.2024.
//

import SwiftUI

struct ItemView: View {
    @StateObject var viewModel = ItemViewViewModel()
    let item: NewItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    .bold()
                
                Text(item.subTitle)
                    .font(.headline)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            
            Spacer()
            
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }) {
                Image(systemName: item.isDone ? "checkmark.circle" : "circle")
            }
        }
    }
}

#Preview {
    ItemView(item: .init(id: "123", title: "Örnek Başlık", subTitle: "Açıklama", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
