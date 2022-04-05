
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
    
    
    var body: some View {
        Group {
            TabView(selection: $selectedTab){
                NavigationView{
                    Home()
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.Home)
                
                NavigationView{
                    Battles(viewModel: BattleView(pokemonStore))
                }
                .tabItem {
                    Label("Battles", systemImage: "person.2.fill")
                }
                .tag(Tab.Battles)
                
                NavigationView {
                    Search(viewModel: SearchView(pokemonStore: pokemonStore))
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tab.Search)
                
                NavigationView{
                    InventoryScreen(viewModel: InventoryView(pokeStore: pokemonStore))
                }
                .tabItem{
                    Label("Inventory", systemImage: "list.dash")
                        
                }
                .tag(Tab.Inventory)
            }
        }
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
