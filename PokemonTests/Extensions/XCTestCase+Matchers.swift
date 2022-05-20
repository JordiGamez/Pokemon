
import XCTest
import SwiftyMocky
@testable import Pokemon

extension XCTestCase {
    
    func buildMatchersForPokemon() {
        buildPokemonMatcher()
        buildPokemonDetailModelMatcher()
        buildPokemonListModelMatcher()
    }
}

private extension XCTestCase {
    
    func buildPokemonMatcher() {
        Matcher.default.register(Pokemon.self) { (lhs, rhs) -> Bool in
            lhs.number == rhs.number
        }
    }
    
    func buildPokemonDetailModelMatcher() {
        Matcher.default.register(PokemonDetailModel.self) { (lhs, rhs) -> Bool in
            lhs.number == rhs.number
        }
    }
    
    func buildPokemonListModelMatcher() {
        Matcher.default.register(PokemonListModel.self) { (lhs, rhs) -> Bool in
            lhs.pokemon.first?.number == rhs.pokemon.first?.number
        }
    }
}
