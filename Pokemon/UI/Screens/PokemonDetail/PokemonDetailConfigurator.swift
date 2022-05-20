
import UIKit
import RxSwift

class PokemonDetailConfigurator {
    
    private var injector: Injector { PokemonInjectorProvider.shared.injector }
    
    func viewController(pokemon: Pokemon) -> UIViewController {
        let viewController = PokemonDetailViewController()
        let router = PokemonDetailRouterDefault()
        let presenter = PokemonDetailPresenterDefault(view: viewController,
                                                      getPokemonEvolutionChainInteractor: injector.instanceOf(GetPokemonEvolutionChainInteractor.self),
                                                      addPokemonFavoriteInteractor: injector.instanceOf(AddPokemonFavoriteInteractor.self),
                                                      removePokemonFavoriteInteractor: injector.instanceOf(RemovePokemonFavoriteInteractor.self),
                                                      isFavoritePokemonInteractor: injector.instanceOf(IsFavoritePokemonInteractor.self),
                                                      subscribeScheduler: ConcurrentDispatchQueueScheduler(qos: .background),
                                                      observeScheduler: MainScheduler.instance,
                                                      router: router)
        
        viewController.presenter = presenter
        viewController.pokemon = pokemon
        presenter.pokemon = pokemon
        router.view = viewController
        
        return viewController
    }
}
