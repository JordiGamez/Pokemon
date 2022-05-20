
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class GetPokemonListInteractorTests: XCTestCase {
    
    // Class
    var interactor: GetPokemonListInteractor!
    
    // Mock
    var pokemonRepository: PokemonRepositoryMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() {
        let pokemonListResponse = buildPokemonListResponse()
        
        // Given
        Given(pokemonRepository, .getList(region: .value(.kanto), willReturn: .just(pokemonListResponse)))
        
        // When
        let result = try? interactor.execute(region: .kanto).toBlocking().first()!
        
        // Then
        XCTAssertEqual(result?.pokemon.count, 1)
        XCTAssertEqual(result?.pokemon.first?.number, "25")
        XCTAssertEqual(result?.pokemon.first?.imageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
        XCTAssertEqual(result?.pokemon.first?.name, "pikachu")
        XCTAssertEqual(result?.pokemon.first?.url, "https://pokeapi.co/api/v2/pokemon/25/")
    }
    
    func test_execute_error() {
        // Given
        Given(pokemonRepository, .getList(region: .value(.kanto), willReturn: .error(DomainError.noDataFound)))
        
        // When
        let result = try? interactor.execute(region: .kanto).toBlocking().first()!
        
        // Then
        XCTAssertNil(result)
    }
}

private extension GetPokemonListInteractorTests {
    
    func buildMocks() {
        pokemonRepository = PokemonRepositoryMock()
    }
    
    func buildClass() {
        interactor = GetPokemonListInteractorDefault(pokemonRepository: pokemonRepository)
    }
    
    func buildPokemonListResponse() -> PokemonListResponse {
        PokemonListResponse(pokemon: [PokemonResponse(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")])
    }
}
