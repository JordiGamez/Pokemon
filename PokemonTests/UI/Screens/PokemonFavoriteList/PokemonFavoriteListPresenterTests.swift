
import XCTest
import SwiftyMocky
import RxSwift
import RxTest
@testable import Pokemon

class PokemonFavoriteListPresenterTests: XCTestCase {
    
    // Class
    var presenter: PokemonFavoriteListPresenterDefault!
    
    // Mock
    var pokemonFavoriteListView: PokemonFavoriteListViewMock!
    var getPokemonFavoriteListInteractor: GetPokemonFavoriteListInteractorMock!
    var emptyPokemonFavoriteInteractor: EmptyPokemonFavoriteInteractorMock!
    var testScheduler: TestScheduler!
    var pokemonFavoriteListRouter: PokemonFavoriteListRouterMock!
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
        buildMatchersForPokemon()
    }
    
    override func tearDown() {
        super.tearDown()
        clean()
    }
    
    func test_loadData_success() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(getPokemonFavoriteListInteractor, .execute(willReturn: .just(pokemonDetailModel)))
        
        // When
        presenter.loadData()
        testScheduler.start()
        
        // Then
        Verify(pokemonFavoriteListView, .showPokemonList(pokemon: .value(pokemonDetailModel)))
    }
    
    func test_loadData_error() {
        // Given
        Given(getPokemonFavoriteListInteractor, .execute(willReturn: .error(DomainError.noDataFound)))
        
        // When
        presenter.loadData()
        testScheduler.start()
        
        // Then
        Verify(pokemonFavoriteListView, .showPokemonList(pokemon: .value([])))
    }
    
    func test_showPokemonDetail_success() {
        let pokemon = buildPokemon()
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // When
        presenter.showPokemonDetail(pokemonDetail: pokemonDetailModel.first!)
        
        // Then
        Verify(pokemonFavoriteListRouter, .navigateToPokemonDetail(pokemon: .value(pokemon)))
    }
    
    func test_emptyFavoriteList_success() {
        // Given
        Given(emptyPokemonFavoriteInteractor, .execute(willReturn: .empty()))
        
        // When
        presenter.emptyFavoriteList()
        testScheduler.start()
        
        // Then
        Verify(pokemonFavoriteListView, .reloadFavoriteList())
    }
    
    func test_close_success() {
        // When
        presenter.close()
        
        // Then
        Verify(pokemonFavoriteListRouter, .dismiss())
    }
}

private extension PokemonFavoriteListPresenterTests {
    
    func buildMocks() {
        pokemonFavoriteListView = PokemonFavoriteListViewMock()
        getPokemonFavoriteListInteractor = GetPokemonFavoriteListInteractorMock()
        emptyPokemonFavoriteInteractor = EmptyPokemonFavoriteInteractorMock()
        testScheduler = TestScheduler(initialClock: 0)
        pokemonFavoriteListRouter = PokemonFavoriteListRouterMock()
    }
    
    func buildClass() {
        presenter =  PokemonFavoriteListPresenterDefault(view: pokemonFavoriteListView,
                                                         getPokemonFavoriteListInteractor: getPokemonFavoriteListInteractor,
                                                         emptyPokemonFavoriteInteractor: emptyPokemonFavoriteInteractor,
                                                         subscribeScheduler: testScheduler,
                                                         observeScheduler: testScheduler,
                                                         router: pokemonFavoriteListRouter)
    }
    
    func clean() {
        testScheduler = nil
    }
}
