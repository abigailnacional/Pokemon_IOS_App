
import SwiftUI

struct Home: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Welcome back, Professor Phillips!").font(Font.custom("Minecraft", size: 15))
                    .padding(15)
                    .background(Color.gray)
                    .cornerRadius(30)
                Image("profile photo")
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                Text("Your Top 3")
                    .padding(.bottom, 10)
                    .font(Font.custom("Minecraft", size: 20))
                Image("dummy top three")
            }
        }
        /*
        TabView {
            ZStack {
                Text("Pickachooze")
                List {
                    Text("Welcome Back!")
                    Text("image")
                    Text("Your top 3")
                }
            }
        }*/
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
