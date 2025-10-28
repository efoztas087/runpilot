import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("🏃‍♂️ RunPilot")
                .font(.largeTitle)
                .bold()
            Text("Welcome to your AI running coach")
                .foregroundColor(.gray)
            Button(action: {
                print("Start Run tapped")
            }) {
                Text("Start Run")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ContentView()
}

