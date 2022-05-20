
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class IsFavoritePokemonInteractorTests: XCTestCase {
    
    // Class
    var interactor: IsFavoritePokemonInteractor!
    
    // Mock
    var persistentStorage: PersistentStorageMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    func test_execute_isFavorite() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(persistentStorage, .retrieveList(willReturn: pokemonDetailModel))
        
        // When
        let result = try? interactor.execute(pokemonDetail: pokemonDetailModel.first!).toBlocking().first()!
        
        // Then
        guard let result = result else {
            XCTFail("result should not be nil")
            return
        }
        XCTAssertTrue(result)
    }
    
    func test_execute_isNotFavorite() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(persistentStorage, .retrieveList(willReturn: []))
        
        // When
        let result = try? interactor.execute(pokemonDetail: pokemonDetailModel.first!).toBlocking().first()!
        
        // Then
        guard let result = result else {
            XCTFail("result should not be nil")
            return
        }
        XCTAssertFalse(result)
    }
}

private extension IsFavoritePokemonInteractorTests {
    
    func buildMocks() {
        persistentStorage = PersistentStorageMock()
    }
    
    func buildClass() {
        interactor = IsFavoritePokemonInteractorDefault(persistentStorage: persistentStorage)
    }
}
