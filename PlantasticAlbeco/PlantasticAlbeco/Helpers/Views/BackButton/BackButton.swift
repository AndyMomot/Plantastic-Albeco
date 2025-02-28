import SwiftUI

struct BackButton: View {
    var title: String
    var canDismiss = true
    var action: (() -> Void)?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack(spacing: 25) {
            if canDismiss {
                Button {
                    action?()
                    dismiss.callAsFunction()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.jadeGreen)
                        .padding(14)
                }
            }
            
            Spacer()
            
            Text(title)
                .lineLimit(2)
                .minimumScaleFactor(0.6)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            if canDismiss {
                Image(systemName: "arrow.left")
                    .padding(14)
                    .hidden()
            }
        }
        .foregroundStyle(.black)
        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 18))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ZStack {
        VStack(spacing: 20) {
            BackButton(title: "Telefony") {}
            BackButton(title: "Telefony") {}
        }
        .padding()
    }
}
