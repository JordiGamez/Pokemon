
import XCTest
import SwiftyMocky
@testable import Pokemon

class PokemonDetailRouterTests: XCTestCase {
    
    // Class
    var router: PokemonDetailRouterDefault!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_navigateToShare_success() {
        // When
        router.navigateToShare(image: UIImage())
    }
}

private extension PokemonDetailRouterTests {
    
    func buildClass() {
        router = PokemonDetailRouterDefault()
    }
}
