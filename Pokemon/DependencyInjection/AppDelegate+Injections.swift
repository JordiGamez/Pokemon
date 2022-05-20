
import Foundation
import Swinject

extension AppDelegate {
    
    func configureInjections() {
        _ = PokemonInjectorProvider.shared
            .add(PokemonModule.self)
    }
}
