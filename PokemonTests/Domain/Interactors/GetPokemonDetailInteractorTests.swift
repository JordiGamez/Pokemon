
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class GetPokemonDetailInteractorTests: XCTestCase {
    
    // Class
    var interactor: GetPokemonDetailInteractor!
    
    // Mock
    var pokemonRepository: PokemonRepositoryMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() {
        let pokemonDetailResponse = buildPokemonDetailResponse()
        
        // Given
        Given(pokemonRepository, .getDetail(number: "25", willReturn: .just(pokemonDetailResponse)))
        
        // When
        let result = try? interactor.execute(number: "25").toBlocking().first()!
        
        // Then
        XCTAssertEqual(result?.number, 25)
        XCTAssertEqual(result?.name, "pikachu")
        XCTAssertEqual(result?.imageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
        XCTAssertEqual(result?.types.count, 1)
        XCTAssertEqual(result?.types.first?.name, .electric)
        XCTAssertEqual(result?.types.first?.url, "https://pokeapi.co/api/v2/type/13/")
        XCTAssertEqual(result?.height, 4)
        XCTAssertEqual(result?.weight, 60)
    }
    
    func test_execute_error() {
        // Given
        Given(pokemonRepository, .getDetail(number: "25", willReturn: .error(DomainError.noDataFound)))
        
        // When
        let result = try? interactor.execute(number: "25").toBlocking().first()!
        
        // Then
        XCTAssertNil(result)
    }
}

private extension GetPokemonDetailInteractorTests {
    
    func buildMocks() {
        pokemonRepository = PokemonRepositoryMock()
    }
    
    func buildClass() {
        interactor = GetPokemonDetailInteractorDefault(pokemonRepository: pokemonRepository)
    }
    
    func buildPokemonDetailResponse() -> PokemonDetailResponse {
        .init(id: 25,
              name: "pikachu",
              sprites: Sprites(other: Other(artwork: Artwork(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"))),
              types: [buildPokemonTypesResponse()],
              height: 4,
              weight: 60,
              stats: [buildPokemonStatsResponse()])
    }
    
    func buildPokemonTypesResponse() -> PokemonTypesResponse {
        .init(type: PokemonTypeResponse(name: .electric,
                                        url: "https://pokeapi.co/api/v2/type/13/"))
    }
    
    func buildPokemonStatsResponse() -> PokemonStatsResponse {
        .init(value: 50, stat: buildPPokemonStatResponse())
    }
    
    func buildPPokemonStatResponse() -> PokemonStatResponse {
        .init(name: "speed")
    }
}
