
import XCTest
import SwiftyMocky
import RxSwift
import RxTest
@testable import Pokemon

class PokemonDetailPresenterTests: XCTestCase {
    
    // Class
    var presenter: PokemonDetailPresenterDefault!
    
    // Mock
    var pokemonDetailView: PokemonDetailViewMock!
    var getPokemonEvolutionChainInteractor: GetPokemonEvolutionChainInteractorMock!
    var addPokemonFavoriteInteractor: AddPokemonFavoriteInteractorMock!
    var removePokemonFavoriteInteractor: RemovePokemonFavoriteInteractorMock!
    var isFavoritePokemonInteractor: IsFavoritePokemonInteractorMock!
    var testScheduler: TestScheduler!
    var pokemonDetailRouter: PokemonDetailRouterMock!
    
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
        let pokemon = buildPokemon()
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(getPokemonEvolutionChainInteractor, .execute(number: .value(pokemon.number), willReturn: .just(pokemonDetailModel)))
        
        // When
        presenter.pokemon = pokemon
        presenter.loadData()
        testScheduler.start()
        
        // Then
        Verify(pokemonDetailView, .showEvolutionChain(model: .value(pokemonDetailModel)))
    }
    
    func test_loadDataEvolutionChainError_error() {
        let pokemon = buildPokemon()
        
        // Given
        Given(getPokemonEvolutionChainInteractor, .execute(number: .value(pokemon.number), willReturn: .error(DomainError.noDataFound)))
        
        // When
        presenter.pokemon = pokemon
        presenter.loadData()
        testScheduler.start()
        
        // Then
        Verify(pokemonDetailView, .showError())
    }
    
    func test_loadDataEmptyPokemon_error() {
        // When
        presenter.loadData()
        
        // Then
        Verify(pokemonDetailView, .showError())
    }
    
    func test_loadFavoriteStatus_isFavorite_success() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(isFavoritePokemonInteractor, .execute(pokemonDetail: .value(pokemonDetailModel.first!), willReturn: .just(true)))
        
        // When
        presenter.loadFavoriteStatus(pokemonDetail: pokemonDetailModel.first!)
        testScheduler.start()
        
        // Then
        Verify(pokemonDetailView, .showAddedToFavorite(pokemonDetail: .value(pokemonDetailModel.first!)))
    }
    
    func test_loadFavoriteStatus_isNotFavorite_success() {
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(isFavoritePokemonInteractor, .execute(pokemonDetail: .value(pokemonDetailModel.first!), willReturn: .just(false)))
        
        // When
        presenter.loadFavoriteStatus(pokemonDetail: pokemonDetailModel.first!)
        testScheduler.start()
        
        // Then
        Verify(pokemonDetailView, .showRemovedFromFavorite(pokemonDetail: .value(pokemonDetailModel.first!)))
    }
    
    func test_performFavoriteAction_isNotFavorite_success() {
        let pokemon = buildPokemon()
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(isFavoritePokemonInteractor, .execute(pokemonDetail: .value(pokemonDetailModel.first!), willReturn: .just(false)))
        Given(addPokemonFavoriteInteractor, .execute(pokemonDetail: .value(pokemonDetailModel.first!), willReturn: .empty()))
        
        // When
        presenter.pokemon = pokemon
        presenter.performFavoriteAction(pokemonDetail: pokemonDetailModel.first!)
        testScheduler.start()
        
        // Then
        Verify(pokemonDetailView, .showAddedToFavorite(pokemonDetail: .value(pokemonDetailModel.first!)))
    }
    
    func test_performFavoriteAction_isFavorite_success() {
        let pokemon = buildPokemon()
        let pokemonDetailModel = buildPokemonDetailModel(numberOfPokemon: 1)
        
        // Given
        Given(isFavoritePokemonInteractor, .execute(pokemonDetail: .value(pokemonDetailModel.first!), willReturn: .just(true)))
        Given(removePokemonFavoriteInteractor, .execute(pokemonDetail: .value(pokemonDetailModel.first!), willReturn: .empty()))
        
        // When
        presenter.pokemon = pokemon
        presenter.performFavoriteAction(pokemonDetail: pokemonDetailModel.first!)
        testScheduler.start()
        
        // Then
        Verify(pokemonDetailView, .showRemovedFromFavorite(pokemonDetail: .value(pokemonDetailModel.first!)))
    }
    
    func test_share_success() {
        let image = UIImage()
        
        // When
        presenter.share(image: image)
        
        // Then
        Verify(pokemonDetailRouter, .navigateToShare(image: .value(image)))
    }
}

private extension PokemonDetailPresenterTests {
    
    func buildMocks() {
        pokemonDetailView = PokemonDetailViewMock()
        getPokemonEvolutionChainInteractor = GetPokemonEvolutionChainInteractorMock()
        addPokemonFavoriteInteractor = AddPokemonFavoriteInteractorMock()
        removePokemonFavoriteInteractor = RemovePokemonFavoriteInteractorMock()
        isFavoritePokemonInteractor = IsFavoritePokemonInteractorMock()
        testScheduler = TestScheduler(initialClock: 0)
        pokemonDetailRouter = PokemonDetailRouterMock()
    }
    
    func buildClass() {
        presenter =  PokemonDetailPresenterDefault(view: pokemonDetailView,
                                                   getPokemonEvolutionChainInteractor: getPokemonEvolutionChainInteractor,
                                                   addPokemonFavoriteInteractor: addPokemonFavoriteInteractor,
                                                   removePokemonFavoriteInteractor: removePokemonFavoriteInteractor,
                                                   isFavoritePokemonInteractor: isFavoritePokemonInteractor,
                                                   subscribeScheduler: testScheduler,
                                                   observeScheduler: testScheduler,
                                                   router: pokemonDetailRouter)
    }
    
    func clean() {
        testScheduler = nil
    }
}
