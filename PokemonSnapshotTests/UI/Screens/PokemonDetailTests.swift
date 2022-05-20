
import XCTest
import SnapshotTesting
@testable import Pokemon

class PokemonDetailTests: XCTestCase {
    
    private var pokemonDetailViewController: PokemonDetailViewController!
    private var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_pokemon_detail_one() {
        pokemonDetailViewController.evolutionChainModel = buildPokemonDetailModel(numberOfPokemon: 1)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_detail_two() {
        pokemonDetailViewController.evolutionChainModel = buildPokemonDetailModel(numberOfPokemon: 2)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_detail_three() {
        pokemonDetailViewController.evolutionChainModel = buildPokemonDetailModel(numberOfPokemon: 3)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
}

private extension PokemonDetailTests {
    
    func buildClass() {
        pokemonDetailViewController = PokemonDetailViewController()
        pokemonDetailViewController.pokemon = buildPokemon()
    }
    
    func buildViewController() {
        viewController = UINavigationController(rootViewController: pokemonDetailViewController)
    }
}
