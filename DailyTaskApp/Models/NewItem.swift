//
//  NewItem.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 25.08.2024.
//

import Foundation

struct NewItem : Codable, Identifiable {
    
    let id: String
    let title: String
    let subTitle: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        
        isDone = state
        
    }
    
}
