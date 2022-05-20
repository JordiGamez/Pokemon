
import Foundation

protocol URLRequestPreprocessor {
    /**
     Update the URLRequest
    */
    func update(request: inout URLRequest)
}

class RepositoryHeaderPreprocessorBase: URLRequestPreprocessor {
    
    init() {}
    
    /**
     Override this method to include new http headers to URLRequest. The
     headers included at this method *override* the previous already included
     at http request
    */
    func headers() -> [String: String] {
        return [:]
    }
    
    func update(request: inout URLRequest) {
        var httpHeaders: [String: String] = [:]
        if let currentHeaders = request.allHTTPHeaderFields {
            httpHeaders = currentHeaders
        }
        
        httpHeaders.merge(headers()) { (_, new) -> String in return new }
        request.allHTTPHeaderFields = httpHeaders
    }
}
