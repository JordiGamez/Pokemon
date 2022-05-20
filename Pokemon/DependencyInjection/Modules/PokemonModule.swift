
import Foundation
import Swinject

class PokemonModule: InjectorModule {
    
    override func configure(_ container: Container) {
        configureCommon(container)
        configureList(container)
        configureDetail(container)
        configureEvolutionChain(container)
        configureFavorite(container)
    }
    
    private func configureCommon(_ container: Container) {
        container.register(PersistentStorage.self) { _ in
            PersistentStorageDefault()
        }
        
        container.register(ServerConfiguration.self) { _ in
            ServerConfigurationDefault()
        }
        
        container.register(ServiceQueueProvider.self) { _ in
            ServiceQueueProviderDefault()
        }
        
        container.register(URLSessionConfiguration.self, name: "default") { _ in
            URLSessionConfiguration.default
        }
        
        container.register(PokemonRepository.self) { resolver in
            let configuration = resolver.resolve(ServerConfiguration.self)!
            let queueProvider = resolver.resolve(ServiceQueueProvider.self)!
            return PokemonRepositoryDefault(configuration: configuration,
                                            queueProvider: queueProvider)
        }
    }
    
    private func configureList(_ container: Container) {
        container.register(GetPokemonListInteractor.self) { resolver in
            let pokemonRepository = resolver.resolve(PokemonRepository.self)!
            return GetPokemonListInteractorDefault(pokemonRepository: pokemonRepository)
        }
    }
    
    private func configureDetail(_ container: Container) {
        container.register(GetPokemonDetailInteractor.self) { resolver in
            let pokemonRepository = resolver.resolve(PokemonRepository.self)!
            return GetPokemonDetailInteractorDefault(pokemonRepository: pokemonRepository)
        }
    }
    
    private func configureEvolutionChain(_ container: Container) {
        container.register(GetPokemonSpeciesInteractor.self) { resolver in
            let pokemonRepository = resolver.resolve(PokemonRepository.self)!
            return GetPokemonSpeciesInteractorDefault(pokemonRepository: pokemonRepository)
        }
        
        container.register(GetPokemonEvolutionChainInteractor.self) { resolver in
            let pokemonRepository = resolver.resolve(PokemonRepository.self)!
            let getPokemonSpeciesInteractor = resolver.resolve(GetPokemonSpeciesInteractor.self)!
            let getPokemonDetailInteractor = resolver.resolve(GetPokemonDetailInteractor.self)!
            return GetPokemonEvolutionChainInteractorDefault(pokemonRepository: pokemonRepository,
                                                             getPokemonSpeciesInteractor: getPokemonSpeciesInteractor,
                                                             getPokemonDetailInteractor: getPokemonDetailInteractor)
        }
    }
    
    private func configureFavorite(_ container: Container) {
        container.register(GetPokemonFavoriteListInteractor.self) { resolver in
            let persistentStorage = resolver.resolve(PersistentStorage.self)!
            return GetPokemonFavoriteListInteractorDefault(persistentStorage: persistentStorage)
        }
        
        container.register(AddPokemonFavoriteInteractor.self) { resolver in
            let persistentStorage = resolver.resolve(PersistentStorage.self)!
            return AddPokemonFavoriteInteractorDefault(persistentStorage: persistentStorage)
        }
        
        container.register(EmptyPokemonFavoriteInteractor.self) { resolver in
            let persistentStorage = resolver.resolve(PersistentStorage.self)!
            return EmptyPokemonFavoriteInteractorDefault(persistentStorage: persistentStorage)
        }
        
        container.register(RemovePokemonFavoriteInteractor.self) { resolver in
            let persistentStorage = resolver.resolve(PersistentStorage.self)!
            return RemovePokemonFavoriteInteractorDefault(persistentStorage: persistentStorage)
        }
        
        container.register(IsFavoritePokemonInteractor.self) { resolver in
            let persistentStorage = resolver.resolve(PersistentStorage.self)!
            return IsFavoritePokemonInteractorDefault(persistentStorage: persistentStorage)
        }
    }
}
