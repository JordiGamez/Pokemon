
import UIKit
import RxSwift

class PokemonListConfigurator {
    
    private var injector: Injector {
        PokemonInjectorProvider.shared.injector
    }
    
    func viewController() -> UIViewController {
        let viewController = PokemonListViewController()
        let router = PokemonListRouterDefault()
        let presenter = PokemonListPresenterDefault(view: viewController,
                                                    getPokemonListInteractor: injector.instanceOf(GetPokemonListInteractor.self),
                                                    getPokemonDetailInteractor: injector.instanceOf(GetPokemonDetailInteractor.self),
                                                    subscribeScheduler: ConcurrentDispatchQueueScheduler(qos: .background),
                                                    observeScheduler: MainScheduler.instance,
                                                    router: router)
        
        viewController.presenter = presenter
        router.view = viewController
        
        return viewController
    }
}
