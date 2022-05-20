
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class RemovePokemonFavoriteInteractorTests: XCTestCase {
    
    // Class
    var interactor: RemovePokemonFavoriteInteractor!
    
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
        Given(persistentStorage, .remove(.value(pokemonDetailModel.first!)))
        
        // When
        let result = interactor.execute(pokemonDetail: pokemonDetailModel.first!).toBlocking().materialize()
        
        // Then
        guard case .completed = result else {
            XCTFail("Is not .completed")
            return
        }
    }
    
    func test_execute_error() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(persistentStorage, .remove(.value(pokemonDetailModel.first!), willThrow: StorageError.notSaved))
        
        // When
        let result = interactor.execute(pokemonDetail: pokemonDetailModel.first!).toBlocking().materialize()
        
        // Then
        guard case .failed = result else {
            XCTFail("Is not .failed")
            return
        }
    }
}

private extension RemovePokemonFavoriteInteractorTests {
    
    func buildMocks() {
        persistentStorage = PersistentStorageMock()
    }
    
    func buildClass() {
        interactor = RemovePokemonFavoriteInteractorDefault(persistentStorage: persistentStorage)
    }
}
