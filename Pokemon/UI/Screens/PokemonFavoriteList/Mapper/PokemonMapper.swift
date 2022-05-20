
import Foundation

class PokemonMapper {
    
    static func map(_ model: PokemonDetailModel) -> Pokemon {
        .init(number: "\(model.number)",
              name: model.name,
              url: "https://pokeapi.co/api/v2/pokemon/\(model.number)",
              imageUrl: model.imageUrl)
    }
}
