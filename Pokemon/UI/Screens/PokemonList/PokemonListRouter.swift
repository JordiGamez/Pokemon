
import UIKit

//sourcery: AutoMockable
protocol PokemonListRouter {
    func navigateToPokemonDetail(pokemon: Pokemon)
    func navigateToFavorites()
}

class PokemonListRouterDefault {
    
    weak var view: UIViewController?
}

extension PokemonListRouterDefault: PokemonListRouter {
    
    func navigateToPokemonDetail(pokemon: Pokemon) {
        let viewController = PokemonDetailConfigurator().viewController(pokemon: pokemon)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToFavorites() {
        let viewController = PokemonFavoriteListConfigurator().viewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        view?.navigationController?.present(navigationController, animated: true)
    }
}
