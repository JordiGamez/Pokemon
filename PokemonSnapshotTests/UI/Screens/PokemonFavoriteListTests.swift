
import XCTest
import SnapshotTesting
@testable import Pokemon

class PokemonFavoriteListTests: XCTestCase {
    
    private var pokemonFavoriteListViewController: PokemonFavoriteListViewController!
    private var viewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_pokemon_favorite_list_zero() {
        pokemonFavoriteListViewController.pokemonList = buildPokemonDetailModel(numberOfPokemon: 0)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_favorite_list_one() {
        pokemonFavoriteListViewController.pokemonList = buildPokemonDetailModel(numberOfPokemon: 1)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_favorite_list_two() {
        pokemonFavoriteListViewController.pokemonList = buildPokemonDetailModel(numberOfPokemon: 2)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_favorite_list_three() {
        pokemonFavoriteListViewController.pokemonList = buildPokemonDetailModel(numberOfPokemon: 3)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
    
    func test_pokemon_favorite_list_10() {
        pokemonFavoriteListViewController.pokemonList = buildPokemonDetailModel(numberOfPokemon: 10)
        buildViewController()
        
        assertSnapshot(matching: viewController, as: .image)
    }
}

private extension PokemonFavoriteListTests {
    
    func buildClass() {
        pokemonFavoriteListViewController = PokemonFavoriteListViewController()
    }
    
    func buildViewController() {
        viewController = UINavigationController(rootViewController: pokemonFavoriteListViewController)
    }
}
