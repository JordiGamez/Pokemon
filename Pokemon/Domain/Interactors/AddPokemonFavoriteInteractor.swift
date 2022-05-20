
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol AddPokemonFavoriteInteractor {
    func execute(pokemonDetail: PokemonDetailModel) -> Completable
}

class AddPokemonFavoriteInteractorDefault: AddPokemonFavoriteInteractor {
    
    private let persistentStorage: PersistentStorage
    
    init(persistentStorage: PersistentStorage) {
        self.persistentStorage = persistentStorage
    }
    
    func execute(pokemonDetail: PokemonDetailModel) -> Completable {
        Completable.create { completable in
            do {
                _ = try self.persistentStorage.save(pokemonDetail)
                completable(.completed)
            } catch let error {
                completable(.error(error))
            }
            return Disposables.create()
        }
    }
}
