//
//  User.swift
//  F1B3
//
//  Created by KimMinSeok on 2/17/25.
//

struct User: Hashable, Codable {
    let id: Int
    let name: String
    let phoneNumber: Int
    let emailAddress: String
    let description: String?
    let profileURL: String
}
