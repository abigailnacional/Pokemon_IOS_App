
import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            ZStack {
                Text("Pickachooze")
                List {
                    Text("Welcome Back!")
                    Text("image")
                    Text("Your top 3")
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
