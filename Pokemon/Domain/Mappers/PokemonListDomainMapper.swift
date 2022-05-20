
import Foundation

class PokemonListDomainMapper {
    
    static func map(_ response: PokemonListResponse) -> PokemonListModel {
        let pokemonList = response.pokemon.map({ buildPokemon($0) })
        return PokemonListModel(pokemon: pokemonList)
    }
}

private extension PokemonListDomainMapper {
    
    static func buildPokemon(_ response: PokemonResponse) -> Pokemon {
        let number = getNumber(url: response.url)
        return Pokemon(number: number,
                       name: response.name,
                       url: response.url,
                       imageUrl: getImageUrl(with: number))
    }
    
    static func getNumber(url: String) -> String {
        let urlArray = url.components(separatedBy: "/")
        return urlArray[6]
    }
    
    static func getImageUrl(with number: String) -> String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(number).png"
    }
}
