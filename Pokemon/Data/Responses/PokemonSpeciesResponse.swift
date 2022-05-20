
import Foundation

struct PokemonSpeciesResponse: Codable {
    
    let evolutionChain: PokemonEvolutionChainURLResponse
    
    var evolutionChainId: String { evolutionChain.evolutionId }
    
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
    }
}

struct PokemonEvolutionChainURLResponse: Codable {
    
    let url: String
}

extension PokemonEvolutionChainURLResponse {
    
    var evolutionId: String {
        let urlArray = url.components(separatedBy: "/")
        return urlArray[6]
    }
}
