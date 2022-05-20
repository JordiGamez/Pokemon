
import Foundation

class PokemonDetailResponseMapper {
    
    func map(from data: Data) throws -> PokemonDetailResponse {
        do {
            return try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
        } catch {
            throw DomainErrorBuilder.createUnknownError(
                message: DomainErrorBuilder.Messages.dataUnknown,
                developerMessage: DomainErrorBuilder.DeveloperMessage.custom(message: "Imposible to decode response")
            )
        }
    }
}
