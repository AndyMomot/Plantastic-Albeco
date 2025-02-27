import SwiftUI

struct TabBarCustomView: View {
    @Binding var selectedItem: Int
    
    private let items: [TabBar.Item] = [
        .init(imageName: Asset.tab1.name, selectedImageName: Asset.tab1s.name),
        .init(imageName: Asset.tab2.name, selectedImageName: Asset.tab2s.name),
        .init(imageName: Asset.tab3.name, selectedImageName: Asset.tab3s.name),
        .init(imageName: Asset.tab4.name, selectedImageName: Asset.tab4s.name),
        .init(imageName: Asset.tab5.name, selectedImageName: Asset.tab5s.name)
    ]
    
    private var arrange: [Int] {
        Array(0..<items.count)
    }
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Spacer(minLength: 10)
            
            ForEach(0..<items.count, id: \.self) { index in
                let item = items[index]
                let isSelected = selectedItem == index
                
                Button {
                    DispatchQueue.main.async {
                        withAnimation {
                            selectedItem = index
                        }
                    }
                } label: {
                    VStack {
                        Spacer()
                        if isSelected {
                            Image(item.selectedImageName)
                                .transition(AnyTransition.scale.animation(.easeInOut))
                        } else {
                            Image(item.imageName)
                                .transition(AnyTransition.scale.animation(.easeInOut))
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer(minLength: 10)
            }
        }
        .padding(.horizontal)
        .background(
            RadialGradient(colors: [.mintGreen, .jadeGreen],
                           center: .top,
                           startRadius: 0,
                           endRadius: 200)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ZStack {
        Color.gray
        VStack {
            Spacer()
            TabBarCustomView(selectedItem: .constant(0))
                .frame(height: 87)
                .padding()
        }
    }
}
