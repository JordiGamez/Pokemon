
import Foundation

/**
 Analyzer that check if an 401 is found at http status code. If found, a
 `DomainError.authenticationError` will be thrown.
 
 - Note: error != nil is ignored
 - Note: if response not conforms HTTPURLResponse, do nothing
*/
class Repository401Analyzer: RepositoryResponseAnalyzer {
    
    static let code401: Int = 401
    
    func analyze(response: URLResponse?, content: Data?, error: Error?) throws {
        guard let httpResponse = response as? HTTPURLResponse else { return }
        guard httpResponse.statusCode == Repository401Analyzer.code401 else { return }
        throw DomainError.authenticationError
    }
}
