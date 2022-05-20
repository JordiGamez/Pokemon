
import XCTest
@testable import Pokemon

class Repository401AnalyzerTests: XCTestCase {
    
    func testShouldNotThrowErrorWhenStatusCodeIsNot401() throws {
        let analyzer = Repository401Analyzer()
        let url = URL(string: "https://www.pokemon.com")!
        let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: nil)
        XCTAssertNoThrow(try analyzer.analyze(response: response, content: nil, error: nil))
    }
    
    func testShouldThrowAuthorizationErrorWhenStatusCodeIs401() throws {
        let analyzer = Repository401Analyzer()
        let url = URL(string: "https://www.pokemon.com")!
        let response = HTTPURLResponse(url: url, statusCode: 401, httpVersion: nil, headerFields: nil)
        XCTAssertThrowsError(try analyzer.analyze(response: response, content: nil, error: nil)) { (error) in
            if case DomainError.authenticationError = error {
                XCTAssertTrue(true)
            } else {
                XCTFail("Unexpected error")
            }
        }
    }
}
