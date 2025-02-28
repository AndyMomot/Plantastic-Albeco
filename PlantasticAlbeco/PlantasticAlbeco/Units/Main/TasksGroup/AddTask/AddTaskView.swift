//
//  AddTaskView.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: ViewModel
    
    init(state: ViewState, viewModel: ViewModel = ViewModel()) {
        viewModel.viewState = state
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color.honeydew
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                BackButton(title: viewModel.viewState.navTitle)
                    .background(.white)
                
                ScrollView {
                    VStack(spacing: 16) {
                        TaskTextField(text: $viewModel.text)
                            .disabled(!viewModel.canEdit)
                        
                        TaskTypePicker(selection: $viewModel.selectedType)
                            .disabled(!viewModel.canEdit)
                        
                        TaskDatePicker(date: $viewModel.date)
                            .disabled(!viewModel.canEdit)
                        
                        TaskAttachments(images: $viewModel.images,
                                        canDelete: viewModel.canEdit)
                        
                        HStack(spacing: 16) {
                            NextButton(title: "Cancel", bgColor: .emeraldGreen.opacity(0.5)) {
                                dismiss.callAsFunction()
                            }
                            
                            switch viewModel.viewState {
                            case .add:
                                NextButton(title: "Create Task") {
                                    Task {
                                        await viewModel.save()
                                        dismiss.callAsFunction()
                                    }
                                }
                                .disabled(viewModel.text.isEmpty)
                            case .edit(let task):
                                NextButton(title: "Delete", bgColor: .red) {
                                    Task {
                                        await viewModel.remove(task: task)
                                        dismiss.callAsFunction()
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
                .scrollIndicators(.never)
            }
        }
        .onAppear {
            switch viewModel.viewState {
            case .add:
                break
            case .edit(let task):
                Task {
                    await self.viewModel.setFields(task: task)
                }
            }
        }
    }
}

#Preview {
    AddTaskView(state: .add)
}

#Preview {
    AddTaskView(state: .edit(task: .init(
        name: "Team meeting",
        type: .health,
        date: .init(),
        imageIds: [])))
}
