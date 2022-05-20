
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetPokemonSpeciesInteractor {
    func execute(number: String) -> Single<PokemonSpeciesResponse>
}

class GetPokemonSpeciesInteractorDefault: GetPokemonSpeciesInteractor {
    
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(number: String) -> Single<PokemonSpeciesResponse> {
        pokemonRepository
            .getPokemonSpecies(number: number)
    }
}
