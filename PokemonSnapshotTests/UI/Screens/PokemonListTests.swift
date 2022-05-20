
import XCTest
import SnapshotTesting
@testable import Pokemon

class PokemonListTests: XCTestCase {
    
    private var pokemonListViewController: PokemonListViewController!
    private var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_pokemon_list_one() {
        pokemonListViewController.model = buildPokemonListModel(numberOfPokemon: 1)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_list_two() {
        pokemonListViewController.model = buildPokemonListModel(numberOfPokemon: 2)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_list_ten() {
        pokemonListViewController.model = buildPokemonListModel(numberOfPokemon: 10)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
}

private extension PokemonListTests {
    
    func buildClass() {
        pokemonListViewController = PokemonListViewController()
    }
    
    func buildViewController() {
        viewController = UINavigationController(rootViewController: pokemonListViewController)
    }
}
