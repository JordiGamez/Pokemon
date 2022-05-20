
import Foundation

protocol RepositoryResponseAnalyzer {
    
    /**
     Analyze the response and return (if needed) a exceptions based on the response
    */
    func analyze(response: URLResponse?, content: Data?, error: Error?) throws
}
