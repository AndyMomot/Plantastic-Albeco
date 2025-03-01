//
//  ProfileView.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 01.03.2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var rootViewModel: RootContentView.ViewModel
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.honeydew
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                CustomNavigationView()
                
                ScrollView {
                    VStack(spacing: 32) {
                        VStack(spacing: 20) {
                            ProfileImageView(uiImage: $viewModel.userImage)
                                .onChange(of: viewModel.userImage) { _ in
                                    Task {
                                        await viewModel.updateUserImage()
                                    }
                                }
                            
                            TextField(text: $viewModel.userName) {
                                Text("Name")
                                    .foregroundStyle(.forestGreen.opacity(0.5))
                            }
                            .foregroundStyle(.forestGreen)
                            .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 20))
                            .multilineTextAlignment(.center)
                            .onChange(of: viewModel.userName) { _ in
                                Task {
                                    await viewModel.updateUserName()
                                }
                            }
                        }
                        
                        ForesterMentorPicker(selection: $viewModel.selectedMentor)
                            .onChange(of: viewModel.selectedMentor) { _ in
                                Task {
                                    await viewModel.updateUserMentor()
                                }
                            }
                        
                        VStack(spacing: 12) {
                            ProfileButton(style: .normal,
                                          title: "Privacy Policy",
                                          systemImage: "chevron.right") {
                                viewModel.showPrivacyPolicy.toggle()
                            }
                            
                            ProfileButton(style: .normal,
                                          title: "Support",
                                          systemImage: "chevron.right") {
                                viewModel.showSupport.toggle()
                            }
                            
                            ProfileButton(style: .normal,
                                          title: "Update Application v\(viewModel.appVersion)",
                                          systemImage: "chevron.right") {
                                if let url = viewModel.appStoreURL {
                                    UIApplication.shared.open(url)
                                }
                            }
                            
                            ProfileButton(style: .destructive,
                                          title: "Delete Data",
                                          systemImage: "trash") {
                                viewModel.showLogoutAlert.toggle()
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                }
                .scrollIndicators(.hidden)
            }
        }
        .onAppear {
            Task {
                await viewModel.getUser()
            }
        }
        .sheet(isPresented: $viewModel.showPrivacyPolicy) {
            SwiftUIViewWebView(url: viewModel.privacyPolicyURL)
        }
        .sheet(isPresented: $viewModel.showSupport) {
            SwiftUIViewWebView(url: viewModel.supportURL)
        }
        .alert("Clear data and exit",
               isPresented: $viewModel.showLogoutAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Confirm", role: .destructive) {
                Task {
                    await viewModel.removeData()
                    await MainActor.run {
                        rootViewModel.setFlow(.onboarding)
                    }
                }
            }
        } message: {
            Text("Are you sure you want to delete all data?")
        }
    }
}

#Preview {
    ProfileView()
}
