
import Foundation

struct PokemonEvolutionChainResponse: Codable {
    
    let chain: PokemonEvolutionChain
    
    var initialFormId: String { chain.species.id }
    var firstEvolutionId: String? { chain.evolution?.first?.species.id }
    var secondEvolutionId: String? { chain.evolution?.first?.evolution?.first?.species.id }
}

struct PokemonEvolutionChain: Codable {
    
    let species: PokemonEvolutionChainSpecies
    let evolution: [PokemonInitialEvolution]?
    
    enum CodingKeys: String, CodingKey {
        case species
        case evolution = "evolves_to"
    }
}

struct PokemonEvolutionChainSpecies: Codable {
    
    let url: String
    
    var id: String {
        let urlArray = url.components(separatedBy: "/")
        return urlArray[6]
    }
}

struct PokemonInitialEvolution: Codable {
    
    let species: PokemonEvolutionChainSpecies
    let evolution: [PokemonFirstEvolution]?
    
    enum CodingKeys: String, CodingKey {
        case species
        case evolution = "evolves_to"
    }
}

struct PokemonFirstEvolution: Codable {
    
    let species: PokemonEvolutionChainSpecies
    let evolution: [PokemonSecondEvolution]?
    
    enum CodingKeys: String, CodingKey {
        case species
        case evolution = "evolves_to"
    }
}

struct PokemonSecondEvolution: Codable {
    
    let species: PokemonEvolutionChainSpecies
}
