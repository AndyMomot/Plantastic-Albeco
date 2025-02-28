//
//  TasksView.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct TasksView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.honeydew
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    CustomNavigationView()
                    
                    ScrollView {
                        VStack(spacing: 24) {
                            ZStack(alignment: .bottom) {
                                Asset.tasksBg.swiftUIImage
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                                CompletedTasksProgress(
                                    allTasks: viewModel.allTasksCount,
                                    completedTasks: viewModel.completesTasksCount)
                                .padding([.leading, .bottom])
                                .padding(.trailing, UIScreen.main.bounds.width * 0.35)
                            }
                            
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    Text("Today's Trails")
                                        .foregroundStyle(.black)
                                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 18))
                                    
                                    Spacer()
                                    
                                    Button {
                                        viewModel.showAddTask.toggle()
                                    } label: {
                                        Text("+ Add")
                                            .foregroundStyle(.white)
                                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
                                            .padding(8)
                                            .background(.jadeGreen)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                }
                                
                                TaskFilter(selection: $viewModel.selectedTaskType)
                                    .onChange(of: viewModel.selectedTaskType) { _ in
                                        Task {
                                            await viewModel.getTasks()
                                        }
                                    }
                                
                                ForEach(viewModel.tasks) { task in
                                    NavigationLink {
                                        AddTaskView(state: .edit(task: task))
                                    } label: {
                                        TaskCell(item: task) {
                                            Task {
                                                await viewModel.onComplete(task: task)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding()
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.horizontal)
                        .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.getTasks()
                }
            }
            .navigationDestination(isPresented: $viewModel.showAddTask) {
                AddTaskView(state: .add)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TasksView()
    }
}
