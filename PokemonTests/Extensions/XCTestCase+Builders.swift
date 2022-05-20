
import Foundation
import XCTest
@testable import Pokemon

extension XCTestCase {
    
    func buildPokemon() -> Pokemon {
        .init(number: "25",
              name: "pikachu",
              url: "https://pokeapi.co/api/v2/pokemon/25/",
              imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
    }
    
    func buildPokemonListModel(numberOfPokemon: Int) -> PokemonListModel {
        .init(pokemon: buildPokemon(numberOfPokemon: numberOfPokemon))
    }
    
    func buildPokemonDetailModel(numberOfPokemon: Int) -> [PokemonDetailModel] {
        var pokemonDetailModel: [PokemonDetailModel] = []
        for _ in 0..<numberOfPokemon { pokemonDetailModel.append(buildPokemonDetailModel()) }
        
        return pokemonDetailModel
    }
}

private extension XCTestCase {
    
    func buildPokemon(numberOfPokemon: Int) -> [Pokemon] {
        var pokemon: [Pokemon] = []
        for _ in 0..<numberOfPokemon { pokemon.append(buildPokemon()) }
        
        return pokemon
    }
    
    func buildPokemonDetailModel() -> PokemonDetailModel {
        .init(number: 25,
              name: "pikachu",
              imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
              types: [buildPokemonType()],
              height: 4,
              weight: 60,
              stats: buildPokemonStats())
    }
    
    func buildPokemonType() -> PokemonType {
        .init(name: .electric, url: "https://pokeapi.co/api/v2/type/13/")
    }
    
    func buildPokemonStats() -> [PokemonStat] {
        [
            .init(name: "speed", value: 10),
            .init(name: "speed", value: 20),
            .init(name: "speed", value: 30),
            .init(name: "speed", value: 40),
            .init(name: "speed", value: 50),
            .init(name: "speed", value: 60)
        ]
    }
}
