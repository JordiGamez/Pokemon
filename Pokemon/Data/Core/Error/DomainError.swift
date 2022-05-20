
import Foundation

enum DomainError: Error {
    
    /// Served when user has a forbidden access (401)
    case authenticationError
        
    /// Unusual error found into web responses
    case invalidServerResponse(reason: DomainErrorMessage)
    
    /// Unknown error found into web responses
    case unknownServiceResponseDueTo(reason: InternalDomainErrorMessage)
    
    /// Fatal error
    case fatal(message: String)
    
    /// An error that present a single error window
    case nonFatal(message: String)
    
    /// Internal server error (500)
    case internalServerError
    
    /// No Data Found (404)
    case noDataFound
    
    /// Unknown error
    case unknown
}

struct DomainErrorMessage {
    
    /// Code provides by server
    let code: String
    
    /// Message provides by server
    let message: String
    
    /// Solution provides by server
    let solution: String
    
    /**
     - Parameter code: Code provides by server
     - Parameter message: Message provides by server
     - Parameter solution: Solution provides by server
     */
    init(code: String, message: String, solution: String) {
        self.code = code
        self.message = message
        self.solution = solution
    }
}

struct InternalDomainErrorMessage {
    /// Message provides to user
    let message: String
    
    /// Message provides to analytics tools
    let developerMessage: String
    
    /**
     - Parameter message: Message provides to user
     - Parameter developerMessage: Message provides to analytics tools
     */
    init(message: String, developerMessage: String) {
        self.message = message
        self.developerMessage = developerMessage
    }
}

class DomainErrorBuilder {
    
    struct Messages {
        
        static let `default`: String = "There was an error."
        
        static let tryItAgain: String = "Try it again."
        
        static let dataUnknown: String = "Unknown data."
    }
    
    struct DeveloperMessage {
        
        static func empty(additionalInfo: String) -> String {
            return "Service response isEmpty: \(additionalInfo)"
        }
        
        static func notAUrl(url: String) -> String {
            return "\(url) is not a valid url"
        }
        
        static func notAJson(additionalInfo: String) -> String {
            return "Service response not generate a valid JsonResponse: \(additionalInfo)"
        }
        
        static func custom(message: String) -> String {
            return message
        }
    }
    
    static func createUnknownError(message: String, developerMessage: String) -> DomainError {
        let error = InternalDomainErrorMessage(message: message, developerMessage: developerMessage)
        return .unknownServiceResponseDueTo(reason: error)
    }
    
    static func createServerError(code: String, message: String, solution: String) -> DomainError {
        let error = DomainErrorMessage(code: code, message: message, solution: solution)
        return .invalidServerResponse(reason: error)
    }
}
