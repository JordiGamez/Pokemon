
import XCTest
import SwiftyMocky
@testable import Pokemon

class PokemonFavoriteListRouterTests: XCTestCase {
    
    // Class
    var router: PokemonFavoriteListRouterDefault!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_navigateToPokemonDetail_success() {
        // When
        router.navigateToPokemonDetail(pokemon: buildPokemon())
    }
    
    func test_dismiss_success() {
        // When
        router.dismiss()
    }
}

private extension PokemonFavoriteListRouterTests {
    
    func buildClass() {
        router = PokemonFavoriteListRouterDefault()
    }
}
