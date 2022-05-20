
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetPokemonDetailInteractor {
    func execute(number: String) -> Single<PokemonDetailModel>
}

class GetPokemonDetailInteractorDefault: GetPokemonDetailInteractor {
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(number: String) -> Single<PokemonDetailModel> {
        pokemonRepository
            .getDetail(number: number)
            .map(PokemonDetailDomainMapper.map)
    }
}
