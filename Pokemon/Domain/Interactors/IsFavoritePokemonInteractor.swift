
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol IsFavoritePokemonInteractor {
    func execute(pokemonDetail: PokemonDetailModel) -> Single<Bool>
}

class IsFavoritePokemonInteractorDefault: IsFavoritePokemonInteractor {
    
    private let persistentStorage: PersistentStorage
    
    init(persistentStorage: PersistentStorage) {
        self.persistentStorage = persistentStorage
    }
    
    func execute(pokemonDetail: PokemonDetailModel) -> Single<Bool> {
        Single.create { single in
            if let pokemonList = self.persistentStorage.retrieveList(),
                pokemonList.contains(where: { $0 == pokemonDetail }) {
                single(.success(true))
            } else {
                single(.success(false))
            }
            return Disposables.create()
        }
    }
}
