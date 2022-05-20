
import Foundation

 class URLMockProtocol: URLProtocol {
    
    typealias ExpectedResult = (URLRequest) -> (Configuration)
    static var requestHandler: ExpectedResult!
    
    enum Configuration {
        case data(data: Data)
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        let configuration = Self.requestHandler(request)
        switch configuration {
        case .data(let data):
            processData(data: data)
        }
    }
    
    private func processData(data: Data) {
        let response = HTTPURLResponse()
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        // do nothing
    }
}
