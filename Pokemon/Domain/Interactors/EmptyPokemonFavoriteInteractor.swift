
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol EmptyPokemonFavoriteInteractor {
    func execute() -> Completable
}

class EmptyPokemonFavoriteInteractorDefault: EmptyPokemonFavoriteInteractor {
    
    private let persistentStorage: PersistentStorage
    
    init(persistentStorage: PersistentStorage) {
        self.persistentStorage = persistentStorage
    }
    
    func execute() -> Completable {
        Completable.create { completable in
            self.persistentStorage.clean(for: PersistentStorageKey.pokemonFavoriteList)
            completable(.completed)
            return Disposables.create()
        }
    }
}
