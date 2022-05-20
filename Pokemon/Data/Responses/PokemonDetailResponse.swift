
import Foundation

struct PokemonDetailResponse: Codable {
    
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [PokemonTypesResponse]
    let height: Float
    let weight: Float
    let stats: [PokemonStatsResponse]
}

struct Sprites: Codable {
    
    let other: Other
}

struct Other: Codable {
    
    let artwork: Artwork
    
    enum CodingKeys: String, CodingKey {
        case artwork = "official-artwork"
    }
}

struct Artwork: Codable {
    
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonTypesResponse: Codable, Hashable {
    
    static func == (lhs: PokemonTypesResponse, rhs: PokemonTypesResponse) -> Bool {
        return lhs.type.name == rhs.type.name
    }
    
    let type: PokemonTypeResponse
}

struct PokemonTypeResponse: Codable, Hashable {
    
    let name: PokemonTypeNameResponse
    let url: String
}

enum PokemonTypeNameResponse: String, Codable {
    
    case normal
    case grass
    case poison
    case fire
    case psychic
    case flying
    case ice
    case bug
    case rock
    case water
    case electric
    case ground
    case fairy
    case steel
    case fighting
    case dragon
    case ghost
}

struct PokemonStatsResponse: Codable {
    
    let value: Int
    let stat: PokemonStatResponse
    
    enum CodingKeys: String, CodingKey {
        case value = "base_stat"
        case stat
    }
}

struct PokemonStatResponse: Codable {
    
    let name: String
}
