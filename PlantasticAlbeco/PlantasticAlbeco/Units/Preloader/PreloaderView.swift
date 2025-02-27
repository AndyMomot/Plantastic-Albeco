import SwiftUI

struct PreloaderView: View {
    
    var onDidLoad: () -> Void
    
    @State private var timer: Timer?
    @State private var degrees: Double = 0.0
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.preloader.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 30) {
                    Asset.loager.swiftUIImage
                        .rotationEffect(.degrees(degrees))
                    
                    Text("loading...")
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 34))
                        .multilineTextAlignment(.center)
                }
            }
        }
        .onAppear {
            startTimer()
        }
    }
}

private extension PreloaderView {
    func startTimer() {
        stopTimer()
        
        timer = .scheduledTimer(withTimeInterval: 0.01,
                                repeats: true, block: { timer in
            update(degrees: 1)
        })
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func update(degrees value: Double) {
        let newDegrees = degrees + value
        
        DispatchQueue.main.async {
            withAnimation {
                degrees = newDegrees
            }
        }
        
        if degrees >= 300 {
            stopTimer()
            onDidLoad()
        }
    }
}

#Preview {
    PreloaderView {}
}
