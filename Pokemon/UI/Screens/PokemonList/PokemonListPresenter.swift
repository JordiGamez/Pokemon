
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol PokemonListPresenter {
    func loadData(region: PokemonRegion)
    func showDetail(pokemon: Pokemon)
    func navigateToFavorites()
}

class PokemonListPresenterDefault {
    
    private let view: PokemonListView
    private let getPokemonListInteractor: GetPokemonListInteractor
    private let getPokemonDetailInteractor: GetPokemonDetailInteractor
    private let subscribeScheduler: SchedulerType
    private let observeScheduler: SchedulerType
    private let router: PokemonListRouter
    
    private let disposeBag = DisposeBag()
    
    init(view: PokemonListView,
         getPokemonListInteractor: GetPokemonListInteractor,
         getPokemonDetailInteractor: GetPokemonDetailInteractor,
         subscribeScheduler: SchedulerType,
         observeScheduler: SchedulerType,
         router: PokemonListRouter) {
        self.view = view
        self.getPokemonListInteractor = getPokemonListInteractor
        self.getPokemonDetailInteractor = getPokemonDetailInteractor
        self.subscribeScheduler = subscribeScheduler
        self.observeScheduler = observeScheduler
        self.router = router
    }
}

extension PokemonListPresenterDefault: PokemonListPresenter {
    
    func loadData(region: PokemonRegion) {
        getPokemonListInteractor
            .execute(region: region)
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .do(onSubscribe: { [weak self] in
                self?.view.showSpinner()
            }, onDispose: {[weak self] in
                self?.view.hideSpinner()
            })
            .subscribe(onSuccess: { [weak self] model in
                self?.view.showPokemonList(model: model)
            }, onFailure: { [weak self] _ in
                self?.view.showError(region: region)
            })
            .disposed(by: disposeBag)
    }
    
    func showDetail(pokemon: Pokemon) {
        router.navigateToPokemonDetail(pokemon: pokemon)
    }
    
    func navigateToFavorites() {
        router.navigateToFavorites()
    }
}
