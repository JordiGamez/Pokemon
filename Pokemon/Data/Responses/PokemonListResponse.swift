
import Foundation

struct PokemonListResponse: Codable {
    
    let pokemon: [PokemonResponse]
    
    enum CodingKeys: String, CodingKey {
        case pokemon = "results"
    }
}

struct PokemonResponse: Codable {
    
    let name: String
    let url: String
}
