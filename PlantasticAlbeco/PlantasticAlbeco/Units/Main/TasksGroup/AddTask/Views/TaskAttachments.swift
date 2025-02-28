//
//  TaskAttachments.swift
//  PlantasticAlbeco
//
//  Created by Andrii Momot on 28.02.2025.
//

import SwiftUI

struct TaskAttachments: View {
    @Binding var images: [UIImage]
    var canDelete: Bool = true
    
    @State private var showImagePicker = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 6) {
                Asset.clip.swiftUIImage
                Text("Attachments")
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                
                Spacer()
                
                Asset.camera.swiftUIImage
            }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(images, id: \.self) { uiImage in
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 9))
                            .overlay {
                                if canDelete {
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Button {
                                                images.removeAll(where: { $0 == uiImage })
                                            } label: {
                                                Image(systemName: "xmark.circle.fill")
                                                    .foregroundStyle(.red)
                                            }
                                            .offset(x: 5, y: -5)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                    }
                    
                    if canDelete {
                        Button {
                            showImagePicker.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 9)
                                .fill(.honeydew)
                                .frame(width: 60, height: 60)
                                .overlay {
                                    Image(systemName: "plus")
                                        .foregroundStyle(.emeraldGreen)
                                }
                        }
                    }
                }
                .padding(10)
            }
            .scrollIndicators(.never)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: .constant(.init())) { selection in
                images.append(selection)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.green
        TaskAttachments(images: .constant([.onboard1, .onboard2]))
            .padding()
    }
}
