
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class GetPokemonSpeciesInteractorTests: XCTestCase {
    
    // Class
    var interactor: GetPokemonSpeciesInteractor!
    
    // Mock
    var pokemonRepository: PokemonRepositoryMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() {
        let pokemon = buildPokemon()
        
        // Given
        Given(pokemonRepository, .getPokemonSpecies(number: .value(pokemon.number), willReturn: .just(buildPokemonSpeciesResponse())))
        
        // When
        let result = try? interactor.execute(number: pokemon.number).toBlocking().first()!
        
        // Then
        XCTAssertEqual(result?.evolutionChain.evolutionId, "10")
    }
    
    func test_execute_error() {
        let pokemon = buildPokemon()
        
        // Given
        Given(pokemonRepository, .getPokemonSpecies(number: .value(pokemon.number), willReturn: .error(DomainError.noDataFound)))
        
        // When
        let result = try? interactor.execute(number: pokemon.number).toBlocking().first()!
        
        // Then
        XCTAssertNil(result)
    }
}

private extension GetPokemonSpeciesInteractorTests {
    
    func buildMocks() {
        pokemonRepository = PokemonRepositoryMock()
    }
    
    func buildClass() {
        interactor = GetPokemonSpeciesInteractorDefault(pokemonRepository: pokemonRepository)
    }
    
    func buildPokemonSpeciesResponse() -> PokemonSpeciesResponse {
        .init(evolutionChain: PokemonEvolutionChainURLResponse(url: "https://pokeapi.co/api/v2/evolution-chain/10/"))
    }
}
