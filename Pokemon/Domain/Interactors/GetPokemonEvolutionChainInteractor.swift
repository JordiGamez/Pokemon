
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol GetPokemonEvolutionChainInteractor {
    func execute(number: String) -> Single<[PokemonDetailModel]>
}

class GetPokemonEvolutionChainInteractorDefault: GetPokemonEvolutionChainInteractor {
    
    private let pokemonRepository: PokemonRepository
    private let getPokemonSpeciesInteractor: GetPokemonSpeciesInteractor
    private let getPokemonDetailInteractor: GetPokemonDetailInteractor
    
    init(pokemonRepository: PokemonRepository,
         getPokemonSpeciesInteractor: GetPokemonSpeciesInteractor,
         getPokemonDetailInteractor: GetPokemonDetailInteractor) {
        self.pokemonRepository = pokemonRepository
        self.getPokemonSpeciesInteractor = getPokemonSpeciesInteractor
        self.getPokemonDetailInteractor = getPokemonDetailInteractor
    }
    
    func execute(number: String) -> Single<[PokemonDetailModel]> {
        getPokemonSpeciesInteractor
            .execute(number: number)
            .flatMap {
                self.pokemonRepository.getPokemonEvolutionChain(number: $0.evolutionChainId)
            }
            .map {
                [$0.initialFormId, $0.firstEvolutionId, $0.secondEvolutionId].compactMap({ $0 })
            }
            .flatMap {
                Single.zip($0.map { number in
                    self.getPokemonDetailInteractor.execute(number: number)
                })
            }
    }
}
