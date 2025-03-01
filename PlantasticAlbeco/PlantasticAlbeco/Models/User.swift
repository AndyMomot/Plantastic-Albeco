//
//  User.swift

import Foundation

struct User: Identifiable, Codable {
    private(set) var id = UUID().uuidString
    var userName: String
    var foresterMentor: String
}
