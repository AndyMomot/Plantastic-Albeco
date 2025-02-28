//
//  TasksViewModel.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import Foundation

extension TasksView {
    final class ViewModel: ObservableObject {
        @Published var allTasksCount = 0
        @Published var completesTasksCount = 0
        @Published var tasks: [UserTask] = []
        
        @Published var showAddTask = false
        @Published var selectedTaskType: UserTask.TaskType?
    }
}

extension TasksView.ViewModel {
    func getTasks() async {
        let allTasks = DefaultsService.shared.tasks
        let completesTasksCount = allTasks.filter { $0.isCompleted }.count
        
        var filteredTasks: [UserTask] {
            if let selectedTaskType {
                return allTasks.filter { $0.type == selectedTaskType }
            } else {
                return allTasks
            }
        }
        
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.allTasksCount = allTasks.count
            self.completesTasksCount = completesTasksCount
            self.tasks = filteredTasks
        }
    }
    
    func onComplete(task: UserTask) async {
        let shared = DefaultsService.shared
        guard let index = shared.tasks.firstIndex(where: { $0.id == task.id }) else { return }
        shared.tasks[index].isCompleted = !task.isCompleted
        await getTasks()
    }
}
