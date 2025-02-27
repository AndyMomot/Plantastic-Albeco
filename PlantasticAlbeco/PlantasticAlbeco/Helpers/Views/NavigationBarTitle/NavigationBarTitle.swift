import SwiftUI

struct NavigationBarTitle: View {
    var text: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle(.green)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 28))
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationBarTitle(text: "SETTINGS")
        .background(.red)
}
