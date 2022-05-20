
import Foundation

class RxParameterEncoderBuilder {
    
    static func createEncoder(for request: RxUrlRequest) -> RxParameterEncoder {
        switch request.parametersDestination {
        case .queryString:
            return QueryParameterEncoder()
        case .httpBody:
            return BodyParameterEncoder()
        }
    }
}

/**
 RxParameterEncoder protocol
 */
protocol RxParameterEncoder {
    func encode(rxRequest: RxUrlRequest, into urlRequest: inout URLRequest)
}

/**
 This class encoded into the httpBody field of an urlRequest object the parameters given
 - Parameter rxRequest: Request information provides by the user
 - Parameter urlRequest: inout Apple-Service request where information will be coded
 */
class BodyParameterEncoder: RxParameterEncoder {
    
    func encode(rxRequest: RxUrlRequest, into urlRequest: inout URLRequest) {
        guard let parameters = rxRequest.parameters, !parameters.isEmpty else { return }
        
        switch rxRequest.parametersEncoding {
        case .urlEncoded:
            guard var urlComponents = URLComponents(url: rxRequest.url, resolvingAgainstBaseURL: false) else { return }
            urlComponents.percentEncodedQuery = parameters.urlEncodeQuery()
            urlRequest.url = urlComponents.url
        case .jsonEncoded:
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
    }
}

/**
 This class encoded into the queryString of an urlRequest object the parameters given
 - Parameter rxRequest: Request information provides by the user
 - Parameter urlRequest: inout Apple-Service request where information will be coded
 */
class QueryParameterEncoder: RxParameterEncoder {
    
    func encode(rxRequest: RxUrlRequest, into request: inout URLRequest) {
        guard let parameters = rxRequest.parameters, !parameters.isEmpty else { return }
        guard let url = request.url else { return }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return }
        
        let percentEncodedQuery = (urlComponents.percentEncodedQuery.map { $0 + "&" } ?? "") + parameters.urlEncodeQuery()
        urlComponents.percentEncodedQuery = percentEncodedQuery
        request.url = urlComponents.url
    }
}
