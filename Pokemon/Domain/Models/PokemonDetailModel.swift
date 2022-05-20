
import Foundation

struct PokemonDetailModel {
    
    let number: Int
    let name: String
    let imageUrl: String
    let types: [PokemonType]
    let height: Float
    let weight: Float
    let stats: [PokemonStat]
    
    var isFavorite: Bool = false
}

extension PokemonDetailModel: Codable {}

extension PokemonDetailModel: Equatable {
    
    static func == (lhs: PokemonDetailModel, rhs: PokemonDetailModel) -> Bool {
        lhs.number == rhs.number
    }
}

struct PokemonType {
    
    let name: PokemonTypeName
    let url: String
    
    var id: String {
        let urlArray = url.components(separatedBy: "/")
        return urlArray[6]
    }
}

extension PokemonType: Codable {}

enum PokemonTypeName: String {
    case none
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

extension PokemonTypeName: Codable {}

struct PokemonStat {
    
    let name: String
    let value: Int
    
    var nameFormated: String {
        name.replacingOccurrences(of: "-", with: " ")
    }
}

extension PokemonStat: Codable {}
