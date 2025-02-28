//
//  AddTaskViewModel.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import UIKit.UIImage

extension AddTaskView {
    final class ViewModel: ObservableObject {
        var viewState: AddTaskView.ViewState = .add
        @Published var text = ""
        @Published var selectedType = UserTask.TaskType.personal
        @Published var date = Date()
        @Published var images: [UIImage] = []
        @Published var canEdit = true
    }
}

extension AddTaskView.ViewModel {
    func setFields(task: UserTask) async {
        let images = await getImages(ids: task.imageIds)
        
        await MainActor.run { [weak self] in
            guard let self else { return }
            self.canEdit = false
            self.text = task.name
            self.selectedType = task.type
            self.date = task.date
            self.images = images
        }
    }
    
    func getImages(ids: [String]) async -> [UIImage] {
        var images: [UIImage] = []
        let fileManager = FileManagerService()
        
        for id in ids {
            if let imageData = await fileManager.fetchImage(with: id),
               let image = UIImage(data: imageData) {
                images.append(image)
            }
        }
        
        return images
    }
    
    func save() async {
        var task = UserTask(
            name: text,
            type: selectedType,
            date: date,
            imageIds: []
        )
        
        let imageIDs = await FileManagerService().saveImages(baseID: task.id, images: images)
        task.imageIds = imageIDs
        
        DefaultsService.shared.tasks.append(task)
    }
    
    func remove(task: UserTask) async {
        for id in task.imageIds {
            await FileManagerService().removeImage(with: id)
        }
        
        DefaultsService.shared.tasks.removeAll(where: { $0.id == task.id })
    }
}

extension AddTaskView {
    enum ViewState {
        case add
        case edit(task: UserTask)
        
        var navTitle: String {
            switch self {
            case .add:
                return "New Task"
            case .edit:
                return "Info"
            }
        }
    }
}
