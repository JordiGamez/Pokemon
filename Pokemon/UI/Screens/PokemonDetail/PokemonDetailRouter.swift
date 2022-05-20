
import UIKit

//sourcery: AutoMockable
protocol PokemonDetailRouter {
    func navigateToShare(image: UIImage)
}

class PokemonDetailRouterDefault {
    
    weak var view: UIViewController?
}

extension PokemonDetailRouterDefault: PokemonDetailRouter {
    
    func navigateToShare(image: UIImage) {
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        view?.present(activityViewController, animated: true)
    }
}
