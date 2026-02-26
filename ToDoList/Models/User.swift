//
//  User.swift
//  ToDoList
//
//  Created by Manmeet on 21/02/26.
//

import Foundation

struct User: Codable {
    var id: String
    var username: String
    var email: String
    var joinedOn: TimeInterval 
}
