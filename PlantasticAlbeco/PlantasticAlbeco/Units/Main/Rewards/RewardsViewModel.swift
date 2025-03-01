//
//  RewardsViewModel.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import Foundation

extension RewardsView {
    final class ViewModel: ObservableObject {
        @Published var level = 0
        @Published var allTasks = 0
        @Published var completedTasks = 0
        @Published var leafs = 0
        @Published var allLeafs = 0
    }
}

extension RewardsView.ViewModel {
    func getTasks() async {
        let tasks = DefaultsService.shared.tasks
        
        var level: Int {
            switch tasks.count {
            case ...4:
                return 1
            case 5...9:
                return 2
            case 10...14:
                return 3
            case 15...19:
                return 4
            case 20...24:
                return 5
            case 25...29:
                return 6
            case 30...34:
                return 7
            case 35...39:
                return 8
            case 40...44:
                return 9
            case 45...:
                return 20
            default:
                return .zero
            }
        }
        
        let completedTasks = tasks.filter { $0.isCompleted }.count
        let allLeafs = tasks.map { $0.type.leafs }.reduce(0) {$0 + $1}
        let leafs = tasks.filter { $0.isCompleted }.map { $0.type.leafs }.reduce(0) {$0 + $1}
        
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.level = level
            self.allTasks = tasks.count
            self.completedTasks = completedTasks
            self.allLeafs = allLeafs
            self.leafs = leafs
        }
    }
}
