import SwiftUI

struct NextButton: View {
    var imageName: String?
    var title: String
    var bgColor: Color = .emeraldGreen
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 8) {
                Spacer()
                
                if let imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                }
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                
                Spacer()
            }
            .padding(20)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ZStack {
        Color.gray
        
        VStack {
            NextButton(title: "Další") {}
                .frame(height: 52)
                .padding(.horizontal)
            
            NextButton(imageName: Asset.tasks.name, title: "Další") {}
                .frame(height: 52)
                .padding(.horizontal)
        }
    }
}
