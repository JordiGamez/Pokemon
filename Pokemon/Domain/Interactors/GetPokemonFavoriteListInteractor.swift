
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetPokemonFavoriteListInteractor {
    func execute() -> Single<[PokemonDetailModel]>
}

class GetPokemonFavoriteListInteractorDefault: GetPokemonFavoriteListInteractor {
    
    private let persistentStorage: PersistentStorage
    
    init(persistentStorage: PersistentStorage) {
        self.persistentStorage = persistentStorage
    }
    
    func execute() -> Single<[PokemonDetailModel]> {
        Single.create { single in
            if let pokemonList = self.persistentStorage.retrieveList() {
                single(.success(pokemonList))
            } else {
                single(.failure(StorageError.empty))
            }
            return Disposables.create()
        }
    }
}
