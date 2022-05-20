
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol RemovePokemonFavoriteInteractor {
    func execute(pokemonDetail: PokemonDetailModel) -> Completable
}

class RemovePokemonFavoriteInteractorDefault: RemovePokemonFavoriteInteractor {
    
    private let persistentStorage: PersistentStorage
    
    init(persistentStorage: PersistentStorage) {
        self.persistentStorage = persistentStorage
    }
    
    func execute(pokemonDetail: PokemonDetailModel) -> Completable {
        Completable.create { completable in
            do {
                try self.persistentStorage.remove(pokemonDetail)
                completable(.completed)
            } catch let error {
                completable(.error(error))
            }
            return Disposables.create()
        }
    }
}
