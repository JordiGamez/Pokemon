
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol PokemonFavoriteListPresenter {
    func loadData()
    func showPokemonDetail(pokemonDetail: PokemonDetailModel)
    func emptyFavoriteList()
    func close()
}

class PokemonFavoriteListPresenterDefault {
    
    private let view: PokemonFavoriteListView
    private let getPokemonFavoriteListInteractor: GetPokemonFavoriteListInteractor
    private let emptyPokemonFavoriteInteractor: EmptyPokemonFavoriteInteractor
    private let subscribeScheduler: SchedulerType
    private let observeScheduler: SchedulerType
    private let router: PokemonFavoriteListRouter
    
    private let disposeBag = DisposeBag()
    
    init(view: PokemonFavoriteListView,
         getPokemonFavoriteListInteractor: GetPokemonFavoriteListInteractor,
         emptyPokemonFavoriteInteractor: EmptyPokemonFavoriteInteractor,
         subscribeScheduler: SchedulerType,
         observeScheduler: SchedulerType,
         router: PokemonFavoriteListRouter) {
        self.view = view
        self.getPokemonFavoriteListInteractor = getPokemonFavoriteListInteractor
        self.emptyPokemonFavoriteInteractor = emptyPokemonFavoriteInteractor
        self.subscribeScheduler = subscribeScheduler
        self.observeScheduler = observeScheduler
        self.router = router
    }
}

extension PokemonFavoriteListPresenterDefault: PokemonFavoriteListPresenter {
    
    func loadData() {
        getPokemonFavoriteListInteractor
            .execute()
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .subscribe(onSuccess: { [weak self] pokemon in
                self?.view.showPokemonList(pokemon: pokemon)
            }, onFailure: { [weak self] _ in
                self?.view.showPokemonList(pokemon: [])
            })
            .disposed(by: disposeBag)
    }
    
    func showPokemonDetail(pokemonDetail: PokemonDetailModel) {
        router.navigateToPokemonDetail(pokemon: PokemonMapper.map(pokemonDetail))
    }
    
    func emptyFavoriteList() {
        emptyPokemonFavoriteInteractor
            .execute()
            .subscribe(on: subscribeScheduler)
            .observe(on: observeScheduler)
            .subscribe(onCompleted: { [weak self] in
                self?.view.reloadFavoriteList()
            })
            .disposed(by: disposeBag)
    }
    
    func close() {
        router.dismiss()
    }
}
