import SwiftUI

struct CustomNavigationView: View {
    @State private var level = 0
    @State private var leafs = 0
    
    var body: some View {
        HStack(spacing: 10) {
            Asset.сhristmasTree.swiftUIImage
            Text("Level \(level) Forester")
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
            
            Spacer()
            
            Asset.leaf.swiftUIImage
            Text("\(leafs)")
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
        }
        .padding()
        .background(.jadeGreen.opacity(0.9))
        .onAppear {
            Task {
                await getTasks()
            }
        }
    }
}

private extension CustomNavigationView {
    func getTasks() async {
        let tasks = DefaultsService.shared.tasks
        
        var level: Int {
            switch tasks.count {
            case ...4:
                return 1
            case 5...9:
                return 2
            case 10...14:
                return 3
            case 15...19:
                return 4
            case 20...24:
                return 5
            case 25...29:
                return 6
            case 30...34:
                return 7
            case 35...39:
                return 8
            case 40...44:
                return 9
            case 45...:
                return 20
            default:
                return .zero
            }
        }
        
        let leafs = tasks.filter { $0.isCompleted }.map { $0.type.leafs }.reduce(0) {$0 + $1}
        
        await MainActor.run {
            self.level = level
            self.leafs = leafs
        }
    }
}

#Preview {
    CustomNavigationView()
}
