//
//  Encodable+Extension.swift
//  ToDoList
//
//  Created by Manmeet on 26/02/26.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
