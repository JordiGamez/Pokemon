
import Foundation

class PokemonEvolutionChainResponseMapper {
    
    func map(from data: Data) throws -> PokemonEvolutionChainResponse {
        do {
            return try JSONDecoder().decode(PokemonEvolutionChainResponse.self, from: data)
        } catch let error {
            print(error)
            throw DomainErrorBuilder.createUnknownError(
                message: DomainErrorBuilder.Messages.dataUnknown,
                developerMessage: DomainErrorBuilder.DeveloperMessage.custom(message: "Imposible to decode response")
            )
        }
    }
}
