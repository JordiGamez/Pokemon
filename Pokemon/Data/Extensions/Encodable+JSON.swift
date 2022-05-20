
import Foundation

extension Encodable {
    
    /**
     Translate the encodable self to json with format [String: Any] (if possible)
     - Returns: If object could be translate to json, it json representation
     */
    func toJson() throws -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            guard let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                throw DomainErrorBuilder.createUnknownError(
                    message: DomainErrorBuilder.Messages.dataUnknown,
                    developerMessage: DomainErrorBuilder.DeveloperMessage.custom(message: "Imposible to encode data")
                )
            }
            return result
        } catch {
            throw DomainErrorBuilder.createUnknownError(
                message: DomainErrorBuilder.Messages.dataUnknown,
                developerMessage: DomainErrorBuilder.DeveloperMessage.custom(message: "Imposible to encode data")
            )
        }
    }
}
