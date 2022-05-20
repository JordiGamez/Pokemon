
import Foundation

class PokemonSpeciesResponseMapper {
    
    func map(from data: Data) throws -> PokemonSpeciesResponse {
        do {
            return try JSONDecoder().decode(PokemonSpeciesResponse.self, from: data)
        } catch {
            throw DomainErrorBuilder.createUnknownError(
                message: DomainErrorBuilder.Messages.dataUnknown,
                developerMessage: DomainErrorBuilder.DeveloperMessage.custom(message: "Imposible to decode response")
            )
        }
    }
}
