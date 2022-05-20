
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class GetPokemonFavoriteListInteractorTests: XCTestCase {
    
    // Class
    var interactor: GetPokemonFavoriteListInteractor!
    
    // Mock
    var persistentStorage: PersistentStorageMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_success() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(persistentStorage, .retrieveList(willReturn: pokemonDetailModel))
        
        // When
        let result = try? interactor.execute().toBlocking().first()!
        
        // Then
        XCTAssertEqual(result?.count, 1)
        XCTAssertEqual(result?.first?.number, 25)
        XCTAssertEqual(result?.first?.name, "pikachu")
        XCTAssertEqual(result?.first?.imageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
        XCTAssertEqual(result?.first?.types.count, 1)
        XCTAssertEqual(result?.first?.types.first?.name, .electric)
        XCTAssertEqual(result?.first?.types.first?.url, "https://pokeapi.co/api/v2/type/13/")
        XCTAssertEqual(result?.first?.height, 4)
        XCTAssertEqual(result?.first?.weight, 60)
    }
    
    func test_execute_error() {
        // Given
        Given(persistentStorage, .retrieveList(willReturn: nil))
        
        // When
        let result = try? interactor.execute().toBlocking().first()!
        
        // Then
        XCTAssertNil(result)
    }
}

private extension GetPokemonFavoriteListInteractorTests {
    
    func buildMocks() {
        persistentStorage = PersistentStorageMock()
    }
    
    func buildClass() {
        interactor = GetPokemonFavoriteListInteractorDefault(persistentStorage: persistentStorage)
    }
}
