
import SwiftUI

struct Search: View {
    var pokemon: [Pokemon] = []
    
    var body: some View {
        /*
         NavigationView{
             Text("Choose Your Pokemon!")
             List{
                 
             }
         }
         */
        Text("Choose Your Pokemon!")
        List(pokemon){ pokemon in
            SearchRow(pokemon: pokemon)
        }
    }
}

struct SearchRow: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack{
            AsyncImage(url: pokemon.image){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "circle")
            }
            .frame(maxWidth: 100, maxHeight: 100)
            Text(pokemon.name)
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
