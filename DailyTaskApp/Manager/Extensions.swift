//
//  Extensions.swift
//  DailyTaskApp
//
//  Created by Bayram Yeleç on 25.08.2024.
//

import Foundation


extension Encodable {
    
    func asDictionary() -> [String:Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
    
}
