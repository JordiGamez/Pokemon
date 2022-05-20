
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetPokemonListInteractor {
    func execute(region: PokemonRegion) -> Single<PokemonListModel>
}

class GetPokemonListInteractorDefault: GetPokemonListInteractor {
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(region: PokemonRegion) -> Single<PokemonListModel> {
        pokemonRepository
            .getList(region: region)
            .map(PokemonListDomainMapper.map)
    }
}
