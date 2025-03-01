//
//  InfoViewModel.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import Foundation

extension InfoView {
    final class ViewModel: ObservableObject {
        let faqItems: [FAQCell.Item] = [
            .init(
                title: "How do I track my daily progress?",
                text: "Track your progress through the main dashboard. Complete daily tasks to grow your virtual forest and level up your Forester status."),
                .init(
                    title: "What are achievement badges?",
                    text: "Achievement badges are rewards that recognize your progress and consistency in completing tasks."),
                .init(
                    title: "How to set custom goals?",
                    text: "You can personalize your productivity experience by setting custom goals."),
            
        ]
        
        let tipItems: [TipCell.Item] = [
            .init(
                title: "Morning Routine",
                text: "Start your day with the most important task to build momentum."),
            
                .init(
                    title: "Time Blocking",
                    text: "Allocate specific time blocks for different types of tasks."),
            
                .init(
                    title: "The 2-Minute Rule",
                    text: "If a task takes less than two minutes, do it immediately!"),
        ]
    }
}
