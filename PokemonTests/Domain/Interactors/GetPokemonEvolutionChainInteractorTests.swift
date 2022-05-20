
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class GetPokemonEvolutionChainInteractorTests: XCTestCase {
    
    // Class
    var interactor: GetPokemonEvolutionChainInteractor!
    
    // Mock
    var pokemonRepository: PokemonRepositoryMock!
    var getPokemonSpeciesInteractor: GetPokemonSpeciesInteractorMock!
    var getPokemonDetailInteractor: GetPokemonDetailInteractorMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() {
        let pokemon = buildPokemon()
        let pokemonDetail = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(getPokemonSpeciesInteractor, .execute(number: .value(pokemon.number), willReturn: .just(buildPokemonSpeciesResponse())))
        Given(pokemonRepository, .getPokemonEvolutionChain(number: .any, willReturn: .just(buildPokemonEvolutionChainResponse())))
        Given(getPokemonDetailInteractor, .execute(number: .any, willReturn: .just(pokemonDetail.first!)))
        
        // When
        let result = try? interactor.execute(number: pokemon.number).toBlocking().first()!
        
        // Then
        XCTAssertEqual(result?.first?.number, 25)
    }
}

private extension GetPokemonEvolutionChainInteractorTests {
    
    func buildMocks() {
        pokemonRepository = PokemonRepositoryMock()
        getPokemonSpeciesInteractor = GetPokemonSpeciesInteractorMock()
        getPokemonDetailInteractor = GetPokemonDetailInteractorMock()
    }
    
    func buildClass() {
        interactor = GetPokemonEvolutionChainInteractorDefault(pokemonRepository: pokemonRepository,
                                                               getPokemonSpeciesInteractor: getPokemonSpeciesInteractor,
                                                               getPokemonDetailInteractor: getPokemonDetailInteractor)
    }
    
    func buildPokemonSpeciesResponse() -> PokemonSpeciesResponse {
        .init(evolutionChain: PokemonEvolutionChainURLResponse(url: "https://pokeapi.co/api/v2/evolution-chain/10/"))
    }
    
    func buildPokemonEvolutionChainResponse() -> PokemonEvolutionChainResponse {
        .init(chain: PokemonEvolutionChain(
            species: PokemonEvolutionChainSpecies(url: "https://pokeapi.co/api/v2/pokemon-species/172/"),
            evolution: [PokemonInitialEvolution(
                species: PokemonEvolutionChainSpecies(url: "https://pokeapi.co/api/v2/pokemon-species/25/"),
                evolution: [PokemonFirstEvolution(
                    species: PokemonEvolutionChainSpecies(url: "https://pokeapi.co/api/v2/pokemon-species/26/"),
                    evolution: nil)])]))
    }
}
