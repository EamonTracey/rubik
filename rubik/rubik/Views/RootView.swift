import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Rubik's Cube Solver")
                NavigationLink {
                    CameraView()
                } label: {
                    Text("Solve")
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
