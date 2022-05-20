
import Foundation

class PokemonDetailDomainMapper {
    
    static func map(_ response: PokemonDetailResponse) -> PokemonDetailModel {
        PokemonDetailModel(number: response.id,
                           name: response.name,
                           imageUrl: response.sprites.other.artwork.frontDefault,
                           types: response.types.map({ buildType($0.type) }),
                           height: response.height,
                           weight: response.weight,
                           stats: response.stats.map({ buildStat($0) }))
    }
}

private extension PokemonDetailDomainMapper {
    
    static func buildType(_ response: PokemonTypeResponse) -> PokemonType {
        .init(name: PokemonTypeName(rawValue: response.name.rawValue) ?? .none,
              url: response.url)
    }
    
    static func buildStat(_ response: PokemonStatsResponse) -> PokemonStat {
        .init(name: response.stat.name, value: response.value)
    }
}
