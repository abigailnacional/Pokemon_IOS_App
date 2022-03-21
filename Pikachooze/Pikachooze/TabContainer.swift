import SwiftUI

enum Tab {
    case home
    case battles
    case search
    case inventory
}

struct TabContainer: View {
    @State var selectedTab: Tab = .home
    
    var body: some View {
        Group {
            TabView(selection: $selectedTab){
                NavigationView {
                    HomeView(viewModel: SearchView(apiService: PokemonAPIService()))
                }
                .tabItem {
                    Label("Home", systemImage: "film")
                        .accessibility(label: Text("Home"))
                }
                .tag(Tab.home)
                
                NavigationView {
                    SearchList(viewModel: SearchView(apiService: PokemonAPIService()))
                }
                .tabItem {
                    Label("Search", systemImage: "film")
                        .accessibility(label: Text("Search"))
                }
                .tag(Tab.search)
                
                NavigationView {
                    InventoryPage(viewModel: SearchView(apiService: PokemonAPIService()))
                }
                .tabItem {
                    Label("Inventory", systemImage: "film")
                        .accessibility(label: Text("Inventory"))
                }
                .tag(Tab.inventory)
                
                NavigationView {
                    BattleView(viewModel: SearchView(apiService: PokemonAPIService()))
                }
                .tabItem {
                    Label("Battles", systemImage: "person")
                        .accessibility(label: Text("Battles"))
                }
                .tag(Tab.battles)
                
            }
        }
    }
}

struct TabContainer_Previews: PreviewProvider {
    static var previews: some View {
        TabContainer()
    }
}
