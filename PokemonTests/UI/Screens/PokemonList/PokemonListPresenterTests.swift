
import XCTest
import SwiftyMocky
import RxSwift
import RxTest
@testable import Pokemon

class PokemonListPresenterTests: XCTestCase {
    
    // Class
    var presenter: PokemonListPresenterDefault!
    
    // Mock
    var pokemonListView: PokemonListViewMock!
    var getPokemonListInteractor: GetPokemonListInteractorMock!
    var getPokemonDetailInteractor: GetPokemonDetailInteractorMock!
    var testScheduler: TestScheduler!
    var pokemonListRouter: PokemonListRouterMock!
    
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
        let pokemonListModel = buildPokemonListModel(numberOfPokemon: 1)
        
        // Given
        Given(getPokemonListInteractor, .execute(region: .value(.kanto), willReturn: .just(pokemonListModel)))
        
        // When
        presenter.loadData(region: .kanto)
        testScheduler.start()
        
        // Then
        Verify(pokemonListView, .showPokemonList(model: .value(pokemonListModel)))
    }
    
    func test_loadData_error() {
        // Given
        Given(getPokemonListInteractor, .execute(region: .value(.kanto), willReturn: .error(DomainError.noDataFound)))
        
        // When
        presenter.loadData(region: .kanto)
        testScheduler.start()
        
        // Then
        Verify(pokemonListView, .showError(region: .value(.kanto)))
    }
    
    func test_showDetail_success() {
        let pokemon = buildPokemon()
        let pokemonDetail = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(getPokemonDetailInteractor, .execute(number: "25", willReturn: .just(pokemonDetail.first!)))
        
        // When
        presenter.showDetail(pokemon: pokemon)
        testScheduler.start()
        
        // Then
        Verify(pokemonListRouter, .navigateToPokemonDetail(pokemon: .value(pokemon)))
    }
    
    func test_showDetail_error() {
        let pokemon = buildPokemon()
        
        // Given
        Given(getPokemonDetailInteractor, .execute(number: "25", willReturn: .error(DomainError.noDataFound)))
        
        // When
        presenter.showDetail(pokemon: pokemon)
        testScheduler.start()
        
        // Then
        Verify(pokemonListRouter, .navigateToPokemonDetail(pokemon: .value(pokemon)))
    }
    
    func test_navigateToFavorites_success() {
        // When
        presenter.navigateToFavorites()
        
        // Then
        Verify(pokemonListRouter, .navigateToFavorites())
    }
}

private extension PokemonListPresenterTests {
    
    func buildMocks() {
        pokemonListView = PokemonListViewMock()
        getPokemonListInteractor = GetPokemonListInteractorMock()
        getPokemonDetailInteractor = GetPokemonDetailInteractorMock()
        testScheduler = TestScheduler(initialClock: 0)
        pokemonListRouter = PokemonListRouterMock()
    }
    
    func buildClass() {
        presenter = PokemonListPresenterDefault(view: pokemonListView,
                                                getPokemonListInteractor: getPokemonListInteractor,
                                                getPokemonDetailInteractor: getPokemonDetailInteractor,
                                                subscribeScheduler: testScheduler,
                                                observeScheduler: testScheduler,
                                                router: pokemonListRouter)
    }
    
    func clean() {
        testScheduler = nil
    }
}
