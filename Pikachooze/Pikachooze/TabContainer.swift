
import SwiftUI

enum Tab {
    case Home
    case Battles
    case Search
    case Inventory
}

struct TabContainer: View {
    @State var selectedTab: Tab = .Home
    
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
                    Battles()
                }
                .tabItem {
                    Label("Battles", systemImage: "person.2.fill")
                        
                }
                .tag(Tab.Battles)
                
                NavigationView{
                    Search(viewModel: SearchView(apiService: PokemonAPIService()))
                }
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                        
                }
                .tag(Tab.Search)
                
                NavigationView{
                    Inventory()
                }
                .tabItem{
                    Label("Inventory", systemImage: "list.dash")
                        
                }
                .tag(Tab.Inventory)
            }
        }
    }
}


struct Tab_Container_Previews: PreviewProvider {
    static var previews: some View {
        TabContainer()
    }
}
