import Foundation
import SwiftUI

struct SearchList: View {
    @ObservedObject var viewModel: SearchView
    
    var body: some View {
        List(viewModel.filteredPokemon){ pokemon in
            NavigationLink(destination:
                
            )
            
        }
    }
}

struct SearchRow: View {
    
}
