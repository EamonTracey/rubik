import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "cube.fill")
                .resizable()
                .frame(width: 100, height: 100)
            Spacer()
            HStack {
                Image(systemName: "camera")
                    .foregroundColor(.indigo)
                Text("Walker Bagley")
            }
            HStack {
                Image(systemName: "flame")
                    .foregroundColor(.red)
                Text("Eamon Tracey")
            }
            .padding(.top)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
