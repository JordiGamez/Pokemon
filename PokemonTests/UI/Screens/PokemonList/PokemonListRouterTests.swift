
import XCTest
import SwiftyMocky
@testable import Pokemon

class PokemonListRouterTests: XCTestCase {
    
    // Class
    var router: PokemonListRouterDefault!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_navigateToPokemonDetail_success() {
        // When
        router.navigateToPokemonDetail(pokemon: buildPokemon())
    }
    
    func test_navigateToFavorites_success() {
        // When
        router.navigateToFavorites()
    }
}

private extension PokemonListRouterTests {
    
    func buildClass() {
        router = PokemonListRouterDefault()
    }
}
