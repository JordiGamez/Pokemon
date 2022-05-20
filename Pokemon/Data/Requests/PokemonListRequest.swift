
import Foundation

struct PokemonListRequest: Encodable {
    
    let limit: String
    let offset: String
    
    init(region: PokemonRegion) {
        switch region {
        case .kanto:
            limit = "151"
            offset = "0"
        case .johto:
            limit = "100"
            offset = "151"
        case .hoenn:
            limit = "135"
            offset = "251"
        case .sinnoh:
            limit = "108"
            offset = "386"
        case .unova:
            limit = "155"
            offset = "494"
        case .kalos:
            limit = "72"
            offset = "649"
        case .alola:
            limit = "88"
            offset = "721"
        case .galar:
            limit = "317"
            offset = "809"
        }
    }
}
