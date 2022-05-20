
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol PokemonDetailPresenter {
    var pokemon: Pokemon? { get set }
    
    func loadData()
    func loadFavoriteStatus(pokemonDetail: PokemonDetailModel)
    func performFavoriteAction(pokemonDetail: PokemonDetailModel)
    func share(image: UIImage)
}

class PokemonDetailPresenterDefault {
    
    private let view: PokemonDetailView
    private let getPokemonEvolutionChainInteractor: GetPokemonEvolutionChainInteractor
    private let addPokemonFavoriteInteractor: AddPokemonFavoriteInteractor
    private let removePokemonFavoriteInteractor: RemovePokemonFavoriteInteractor
    private let isFavoritePokemonInteractor: IsFavoritePokemonInteractor
    private let subscribeScheduler: SchedulerType
    private let observeScheduler: SchedulerType
    private let router: PokemonDetailRouter
    
    private let disposeBag = DisposeBag()
    
    var pokemon: Pokemon?
    
    init(view: PokemonDetailView,
         getPokemonEvolutionChainInteractor: GetPokemonEvolutionChainInteractor,
         addPokemonFavoriteInteractor: AddPokemonFavoriteInteractor,
         removePokemonFavoriteInteractor: RemovePokemonFavoriteInteractor,
         isFavoritePokemonInteractor: IsFavoritePokemonInteractor,
         subscribeScheduler: SchedulerType,
         observeScheduler: SchedulerType,
         router: PokemonDetailRouter) {
        self.view = view
        self.getPokemonEvolutionChainInteractor = getPokemonEvolutionChainInteractor
        self.addPokemonFavoriteInteractor = addPokemonFavoriteInteractor
        self.removePokemonFavoriteInteractor = removePokemonFavoriteInteractor
        self.isFavoritePokemonInteractor = isFavoritePokemonInteractor
        self.subscribeScheduler = subscribeScheduler
        self.observeScheduler = observeScheduler
        self.router = router
    }
}

extension PokemonDetailPresenterDefault: PokemonDetailPresenter {
    
    func loadData() {
        guard let pokemon = pokemon else {
            view.showError()
            return
        }
        loadEvolutionChain(pokemon: pokemon)
    }
    
    func loadFavoriteStatus(pokemonDetail: PokemonDetailModel) {
        isFavoritePokemonInteractor
            .execute(pokemonDetail: pokemonDetail)
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .subscribe(onSuccess: { [weak self] isFavorite in
                if isFavorite {
                    self?.view.showAddedToFavorite(pokemonDetail: pokemonDetail)
                } else {
                    self?.view.showRemovedFromFavorite(pokemonDetail: pokemonDetail)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func performFavoriteAction(pokemonDetail: PokemonDetailModel) {
        isFavoritePokemonInteractor
            .execute(pokemonDetail: pokemonDetail)
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .subscribe(onSuccess: { [weak self] isFavorite in
                if isFavorite {
                    self?.removeFromFavorite(pokemonDetail: pokemonDetail)
                } else {
                    self?.addToFavorite(pokemonDetail: pokemonDetail)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func share(image: UIImage) {
        router.navigateToShare(image: image)
    }
}

private extension PokemonDetailPresenterDefault {
    
    func loadEvolutionChain(pokemon: Pokemon) {
        getPokemonEvolutionChainInteractor
            .execute(number: pokemon.number)
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .do(onSubscribe: { [weak self] in
                self?.view.showSpinner()
            }, onDispose: {[weak self] in
                self?.view.hideSpinner()
            })
            .subscribe(onSuccess: { [weak self] evolutionChain in
                self?.view.showEvolutionChain(model: evolutionChain)
            }, onFailure: { [weak self] _ in
                self?.view.showError()
            })
            .disposed(by: disposeBag)
    }
    
    func addToFavorite(pokemonDetail: PokemonDetailModel) {
        addPokemonFavoriteInteractor
            .execute(pokemonDetail: pokemonDetail)
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .subscribe(onCompleted: { [weak self] in
                self?.view.showAddedToFavorite(pokemonDetail: pokemonDetail)
            })
            .disposed(by: disposeBag)
    }
    
    func removeFromFavorite(pokemonDetail: PokemonDetailModel) {
        removePokemonFavoriteInteractor
            .execute(pokemonDetail: pokemonDetail)
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .subscribe(onCompleted: { [weak self] in
                self?.view.showRemovedFromFavorite(pokemonDetail: pokemonDetail)
            })
            .disposed(by: disposeBag)
    }
}
