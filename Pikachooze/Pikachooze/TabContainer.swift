
import SwiftUI

enum Tab {
    case Home
    case Battles
    case Search
    case Inventory
}

struct TabContainer: View {
    @State var selectedTab: Tab = .Home
    @EnvironmentObject var pokemonStore: PokemonStore
    
    init () {
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor(hex: "#386ABBff")
            UITabBar.appearance().standardAppearance = tabBarAppearance

            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
    
    var body: some View {
        VStack{
            Image("logo")
                .padding(.top, 33.0)
                .ignoresSafeArea()
                .foregroundColor(.white)
                .frame(width: 400, height: 70)
                .scaledToFill()
                .background(Color(red: 0.22, green: 0.416, blue: 0.733))
            
            Group {
                TabView(selection: $selectedTab){
                    NavigationView{
                        Home(viewModel: HomeView(pokeStore: pokemonStore))
                    }
                    .tabItem {
                        Image("home small")
                        //Text("Home")
                    }
                    .tag(Tab.Home)
                    
                    NavigationView{
                        Battles(viewModel: BattleView(pokeStore: pokemonStore))
                    }
                    .tabItem {
                        Image("battles small")
                        
                        //Text("Battles")
                    }
                    .tag(Tab.Battles)
                    
                    NavigationView {
                        Search(viewModel: SearchView(pokemonStore: pokemonStore))
                    }
                    .tabItem {
                        Image("search small")
                        //Text("Search")
                    }
                    .tag(Tab.Search)
                    
                    NavigationView{
                        InventoryScreen(viewModel: InventoryView(pokeStore: pokemonStore))
                    }
                    .tabItem{
                        Image("inventory small")
                        //Text("Inventory")
                    }
                    .tag(Tab.Inventory)
                }

                //.accentColor(Color.white)
            }
            .ignoresSafeArea()
        }

    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

//
//struct Tab_Container_Previews: PreviewProvider {
//    static let pokemonStore = PokemonStore()
//    static let gymLeader = GymLeader
//    
//    static var previews: some View {
//        TabContainer(gymLeader: gymLeader)
//    }
//}
