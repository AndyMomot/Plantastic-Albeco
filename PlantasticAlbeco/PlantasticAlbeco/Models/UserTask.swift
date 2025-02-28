//
//  UserTask.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import Foundation

struct UserTask: Identifiable, Codable {
    private(set) var id = UUID().uuidString
    var name: String
    var type: TaskType
    var date: Date
    var imageIds: [String]
    var isCompleted = false
}

extension UserTask {
    enum TaskType: String, CaseIterable, Codable {
        case personal = "Personal"
        case work = "Work"
        case health = "Health"
        
        var icon: String {
            switch self {
            case .personal:
                return Asset.personalTask.name
            case .work:
                return Asset.workTask.name
            case .health:
                return Asset.healthTask.name
            }
        }
        
        var leafs: Int {
            switch self {
            case .personal:
                return 30
            case .work:
                return 35
            case .health:
                return 40
            }
        }
        
        var color: TaskColor {
            switch self {
            case .personal:
                return .red
            case .work:
                return .blue
            case .health:
                return .purple
            }
        }
    }
}

extension UserTask.TaskType {
    enum TaskColor {
        case red, blue, purple
    }
}
