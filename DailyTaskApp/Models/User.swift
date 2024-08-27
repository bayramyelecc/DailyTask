//
//  User.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 24.08.2024.
//

import Foundation

struct User: Codable{
    
    let id : String
    let name : String
    let email : String
    let dueDate : TimeInterval
    
}
