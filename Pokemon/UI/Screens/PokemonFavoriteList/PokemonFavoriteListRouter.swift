
import UIKit

//sourcery: AutoMockable
protocol PokemonFavoriteListRouter {
    func navigateToPokemonDetail(pokemon: Pokemon)
    func dismiss()
}

class PokemonFavoriteListRouterDefault {
    
    weak var view: UIViewController?
}

extension PokemonFavoriteListRouterDefault: PokemonFavoriteListRouter {
    
    func navigateToPokemonDetail(pokemon: Pokemon) {
        let viewController = PokemonDetailConfigurator().viewController(pokemon: pokemon)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func dismiss() {
        view?.navigationController?.dismiss(animated: true)
    }
}
