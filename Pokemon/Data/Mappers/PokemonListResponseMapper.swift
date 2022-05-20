
import Foundation

class PokemonListResponseMapper {
    
    func map(from data: Data) throws -> PokemonListResponse {
        do {
            return try JSONDecoder().decode(PokemonListResponse.self, from: data)
        } catch {
            throw DomainErrorBuilder.createUnknownError(
                message: DomainErrorBuilder.Messages.dataUnknown,
                developerMessage: DomainErrorBuilder.DeveloperMessage.custom(message: "Imposible to decode response")
            )
        }
    }
}
