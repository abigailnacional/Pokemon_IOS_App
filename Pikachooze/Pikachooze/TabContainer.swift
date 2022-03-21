
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
                    Label("Home", systemImage: "home")
                }
                .tag(Tab.Home)
                
                NavigationView{
                    Battles()
                }
                .tabItem {
                    Label("Battles", systemImage: "circle.circle")
                }
                .tag(Tab.Battles)
                
                NavigationView{
                    Search()
                }
                .tabItem {
                    Label("Search", systemImage: "search")
                }
                .tag(Tab.Search)
                
                NavigationView{
                    Inventory()
                }
                .tabItem{
                    Label("Inventory", systemImage: "circle")
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
