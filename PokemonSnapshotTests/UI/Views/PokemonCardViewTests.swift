
import XCTest
import SnapshotTesting
@testable import Pokemon

class PokemonCardViewTests: XCTestCase {
    
    var view: PokemonCardView!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_pokemon_card() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        view.configure(model: pokemonDetailModel.first!)
        
        assertSnapshot(matching: view, as: .image)
    }
}

private extension PokemonCardViewTests {
    
    func buildClass() {
        view = PokemonCardView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}
