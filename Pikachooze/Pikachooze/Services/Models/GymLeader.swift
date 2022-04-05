import Foundation

struct GymLeader: Identifiable, Codable {
    var id: String
    var name: String
    var image: URL
    var gymBadge: URL
    var gymPokemon: [Pokemon]
    
}

extension GymLeader{
    static let previewData = [
        GymLeader(id: "1", name: "Brock", image: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/a/a6/Lets_Go_Pikachu_Eevee_Brock.png/243px-Lets_Go_Pikachu_Eevee_Brock.png")! , gymBadge:URL(string:"https://archives.bulbagarden.net/media/upload/thumb/d/dd/Boulder_Badge.png/1200px-Boulder_Badge.png")!,
            gymPokemon:[
                Pokemon(id:"1", number: "74", name:"Geodude", nickname: "", classification: "Rock Pokémon", types: ["Rock", "Ground"], resistant: ["Normal", "Fire", "Electric", "Poison", "Flying", "Rock"], weaknesses: ["Water", "Grass", "Ice", "Fighting", "Ground", "Steel"], image: URL(string:"https://img.pokemondb.net/artwork/geodude.jpg")!),
                Pokemon(id: "2", number: "095", name: "Onix", nickname: "", classification: "Rock Snake Pokémon", types: ["Rock", "Ground"], resistant: ["Normal", "Fire", "Electric", "Poison", "Flying", "Rock"], weaknesses: ["Water", "Grass", "Ice", "Fighting", "Ground", "Steel"], image: URL(string: "https://img.pokemondb.net/artwork/onix.jpg")!)]),
        GymLeader(id: "2", name: "Misty", image: URL(string:"https://archives.bulbagarden.net/media/upload/f/f6/Lets_Go_Pikachu_Eevee_Misty.png")!, gymBadge: URL(string:"https://archives.bulbagarden.net/media/upload/9/9c/Cascade_Badge.png")!,
            gymPokemon:[
                Pokemon(id:"3", number: "120", name: "Staryu", nickname: "", classification: "Starshape Pokémon", types: ["Water"], resistant: ["Fire", "Water", "Ice", "Steel"], weaknesses: ["Electric", "Grass"], image:URL( string:"https://img.pokemondb.net/artwork/staryu.jpg")!),
                Pokemon(id: "4", number: "121", name: "Starmie", nickname: "", classification: "Mysterious Pokémon", types: ["Water", "Psychic"], resistant: ["Fire", "Water", "Ice", "Fighting", "Psychic", "Steel"], weaknesses: ["Electric", "Grass", "Bug", "Ghost", "Dark"], image: URL(string: "https://img.pokemondb.net/artwork/starmie.jpg")!)
            ]),
        GymLeader(id: "3", name: "Lt. Surge", image: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/b/bc/Lets_Go_Pikachu_Eevee_Lt_Surge.png/866px-Lets_Go_Pikachu_Eevee_Lt_Surge.png")!, gymBadge: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/a/a6/Thunder_Badge.png/1200px-Thunder_Badge.png")!,
            gymPokemon:[
                Pokemon(id: "5", number: "100", name: "Voltorb", nickname: "", classification: "Ball Pokémon", types: ["Electric"], resistant: ["Electric", "Flying", "Steel"], weaknesses: ["Ground"], image: URL(string: "https://img.pokemondb.net/artwork/voltorb.jpg")!),
                Pokemon(id: "6", number: "025", name: "Pikachu", nickname: "", classification: "Mouse Pokémon", types: ["Electric"], resistant: ["Electric", "Flying", "Steel"], weaknesses: ["Ground"], image: URL(string:"https://img.pokemondb.net/artwork/pikachu.jpg")!),
                Pokemon(id: "7", number: "026", name: "Raichu", nickname: "", classification: "Mouse Pokémon", types: ["Electric"], resistant: ["Electric", "Flying", "Steel"], weaknesses: ["Ground"], image: URL(string:"https://img.pokemondb.net/artwork/raichu.jpg")!)
            ]),
        GymLeader(id: "4", name: "Erika", image: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/4/47/Lets_Go_Pikachu_Eevee_Erika.png/487px-Lets_Go_Pikachu_Eevee_Erika.png")!, gymBadge: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/b/b5/Rainbow_Badge.png/1200px-Rainbow_Badge.png")!,
            gymPokemon:[
                Pokemon(id: "8", number: "071", name: "Victreebel", nickname: "", classification: "Flycatcher Pokémon", types: ["Grass", "Poison"], resistant: ["Water", "Electric", "Grass", "Fighting", "Fairy"], weaknesses: ["Fire", "Ice", "Flying", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/victreebel.jpg")!),
                Pokemon(id: "9", number: "114", name: "Tangela", nickname: "", classification: "Vine Pokémon", types: ["Grass"], resistant: ["Water", "Electric", "Grass", "Ground"], weaknesses: ["Fire", "Ice", "Poison", "Flying", "Bug"], image: URL(string:"https://img.pokemondb.net/artwork/tangela.jpg")!),
                Pokemon(id: "10", number: "045", name: "Vileplume", nickname: "", classification: "Flower Pokémon", types: ["Grass", "Poison"], resistant: ["Water", "Electric", "Grass", "Fighting", "Fairy"], weaknesses: ["Fire", "Ice", "Flying", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/vileplume.jpg")!)
            ]),
        GymLeader(id: "5", name: "Koga", image: URL(string:"https://archives.bulbagarden.net/media/upload/f/f4/Lets_Go_Pikachu_Eevee_Koga.png")!, gymBadge: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/7/7d/Soul_Badge.png/1200px-Soul_Badge.png")!,
            gymPokemon:[
                Pokemon(id: "11", number: "109", name: "Koffing", nickname: "", classification: "Poison Gas Pokémon", types: ["Poison"], resistant: ["Grass", "Fighting", "Poison", "Bug", "Fairy"], weaknesses: ["Ground", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/koffing.jpg")!),
                Pokemon(id: "12", number: "109", name: "Koffing", nickname: "", classification: "Poison Gas Pokémon", types: ["Poison"], resistant: ["Grass", "Fighting", "Poison", "Bug", "Fairy"], weaknesses: ["Ground", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/koffing.jpg")!),
                Pokemon(id: "13", number: "089", name: "Muk", nickname: "", classification: "Sludge Pokémon", types: ["Poison"], resistant: ["Grass", "Fighting", "Poison", "Bug", "Fairy"], weaknesses: ["Ground", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/muk.jpg")!),
                Pokemon(id: "14", number: "110", name: "Weezing", nickname: "", classification: "Poison Gas Pokémon", types: ["Poison"], resistant: ["Grass", "Fighting", "Poison", "Bug", "Fairy"], weaknesses: ["Ground", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/weezing.jpg")!)
            ]),
        GymLeader(id: "6", name: "Sabrina", image: URL(string:"https://archives.bulbagarden.net/media/upload/7/78/Lets_Go_Pikachu_Eevee_Sabrina.png")!, gymBadge: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/6/6b/Marsh_Badge.png/1200px-Marsh_Badge.png")!,
            gymPokemon:[
                Pokemon(id: "15", number: "064", name: "Kadabra", nickname: "", classification: "Psi Pokémon", types: ["Psychic"], resistant: ["Fighting", "Psychic"], weaknesses: ["Bug", "Ghost", "Dark"], image: URL(string: "https://img.pokemondb.net/artwork/kadabra.jpg")!),
                Pokemon(id: "16", number: "122", name: "Mr. Mime", nickname: "", classification: "Barrier Pokémon", types: ["Psychic", "Fairy"], resistant: ["Fighting", "Psychic", "Dragon"], weaknesses: ["Poison", "Ghost", "Steel"], image: URL(string:"https://img.pokemondb.net/artwork/mr-mime.jpg")!),
                Pokemon(id: "17", number: "049", name: "Venomoth", nickname: "", classification: "Poison Moth Pokémon", types: ["Bug", "Poison"], resistant: ["Grass", "Fighting", "Poison", "Bug", "Fairy"], weaknesses: ["Fire", "Flying", "Psychic", "Rock"], image: URL(string:"https://img.pokemondb.net/artwork/venomoth.jpg")!),
                Pokemon(id: "18", number: "065", name: "Alakazam", nickname: "", classification: "Psi Pokémon", types: ["Psychic"], resistant: ["Fighting", "Psychic"], weaknesses: ["Bug", "Ghost", "Dark"], image: URL(string:"https://img.pokemondb.net/artwork/alakazam.jpg")!)
            ]),
        GymLeader(id: "7", name: "Blaine", image: URL(string:"https://archives.bulbagarden.net/media/upload/7/78/Lets_Go_Pikachu_Eevee_Sabrina.png")!, gymBadge: URL(string:"https://archives.bulbagarden.net/media/upload/c/c8/Lets_Go_Pikachu_Eevee_Blaine.png")!,
            gymPokemon:[
                Pokemon(id: "19", number: "058", name: "Growlithe", nickname: "", classification: "Puppy Pokémon", types: ["Fire"], resistant: ["Fire", "Grass", "Ice", "Bug", "Steel", "Fairy"], weaknesses: ["Water", "Ground", "Rock"], image: URL(string:"https://img.pokemondb.net/artwork/growlithe.jpg")!),
                Pokemon(id: "20", number: "077", name: "Ponyta", nickname: "", classification: "Fire Horse Pokémon", types: ["Fire"], resistant: ["Fire", "Grass", "Ice", "Bug", "Steel", "Fairy"], weaknesses: ["Water", "Ground", "Rock"], image: URL(string:"https://img.pokemondb.net/artwork/ponyta.jpg")!),
                Pokemon(id: "21", number: "078", name: "Rapidash", nickname: "", classification: "Fire Horse Pokémon", types: ["Fire"], resistant: ["Fire", "Grass", "Ice", "Bug", "Steel", "Fairy"], weaknesses: ["Water", "Ground", "Rock"], image: URL(string:"https://img.pokemondb.net/artwork/rapidash.jpg")!),
                Pokemon(id: "22", number: "059", name: "Arcanine", nickname: "", classification: "Legendary Pokémon", types: ["Fire"], resistant: ["Fire", "Grass", "Ice", "Bug", "Steel", "Fairy"], weaknesses: ["Water", "Ground", "Rock"], image: URL(string:"https://img.pokemondb.net/artwork/arcanine.jpg")!)
            ]),
        GymLeader(id: "8", name: "Giovanni", image: URL(string:"https://archives.bulbagarden.net/media/upload/a/a7/Lets_Go_Pikachu_Eevee_Giovanni.png")!, gymBadge: URL(string:"https://archives.bulbagarden.net/media/upload/thumb/7/78/Earth_Badge.png/1200px-Earth_Badge.png")!,
            gymPokemon:[
                Pokemon(id: "23", number: "111", name: "Rhyhorn", nickname: "", classification: "Spikes Pokémon", types: ["Ground", "Rock"], resistant: ["Normal", "Fire", "Electric", "Poison", "Flying", "Rock"], weaknesses: ["Water", "Grass", "Ice", "Fighting", "Ground", "Steel"], image: URL(string:"https://img.pokemondb.net/artwork/rhyhorn.jpg")!),
                Pokemon(id: "24", number: "051", name: "Dugtrio", nickname: "", classification: "Mole Pokémon", types: ["Ground"], resistant: ["Electric", "Poison", "Rock"], weaknesses: ["Water", "Grass", "Ice"], image: URL(string:"https://img.pokemondb.net/artwork/dugtrio.jpg")!),
                Pokemon(id: "25", number: "031", name: "Nidoqueen", nickname: "", classification: "Drill Pokémon", types: ["Poison", "Ground"], resistant: ["Electric", "Fighting", "Poison", "Bug", "Rock", "Fairy"], weaknesses: ["Water", "Ice", "Ground", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/nidoqueen.jpg,")!),
                Pokemon(id: "26", number: "034", name: "Nidoking", nickname: "", classification: "Drill Pokémon", types: ["Poison", "Ground"], resistant: ["Electric", "Fighting", "Poison", "Bug", "Rock", "Fairy"], weaknesses: ["Water", "Ice", "Ground", "Psychic"], image: URL(string:"https://img.pokemondb.net/artwork/nidoking.jpg")!),
                Pokemon(id: "27", number: "112", name: "Rhydon", nickname: "", classification: "Drill Pokémon", types: ["Ground", "Rock"], resistant: ["Normal", "Fire", "Electric", "Poison", "Flying", "Rock"], weaknesses: ["Water", "Grass", "Ice", "Fighting", "Ground", "Steel"], image: URL(string:"https://img.pokemondb.net/artwork/rhydon.jpg")!)
            ]),
    ]
}
