
import UIKit
import RxSwift

class PokemonFavoriteListConfigurator {
    
    private var injector: Injector {
        PokemonInjectorProvider.shared.injector
    }
    
    func viewController() -> UIViewController {
        let viewController = PokemonFavoriteListViewController()
        let router = PokemonFavoriteListRouterDefault()
        let presenter = PokemonFavoriteListPresenterDefault(view: viewController,
                                                            getPokemonFavoriteListInteractor: injector.instanceOf(GetPokemonFavoriteListInteractor.self),
                                                            emptyPokemonFavoriteInteractor: injector.instanceOf(EmptyPokemonFavoriteInteractor.self),
                                                            subscribeScheduler: ConcurrentDispatchQueueScheduler(qos: .background),
                                                            observeScheduler: MainScheduler.instance,
                                                            router: router)
        
        viewController.presenter = presenter
        router.view = viewController
        
        return viewController
    }
}
