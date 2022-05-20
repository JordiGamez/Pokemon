
import Foundation
import RxSwift

class BaseRxRepositoryBuilder {
    
    /**
     Builder errors
     */
    enum BuilderError: Error {
        case pathNotDefined
    }
    
    /**
     Initializer based on which client will request the service
     */
    init() {
        self.configuration = URLSessionConfiguration.default
    }
    
    private var httpMethod: RxUrlRequest.HttpMethod = .GET
    private var url: String?
    private var parameters: RxUrlRequest.Parameters?
    private var parametersDestination: RxUrlRequest.ParametersDestination = .queryString
    private var parametersEncoding: RxUrlRequest.ParametersEncoding = .jsonEncoded
    private var preprocessorHeaders: [URLRequestPreprocessor] = []
    private var analyzers: [RepositoryResponseAnalyzer] = []
    private var configuration: URLSessionConfiguration

    /// GET by Default
    func set(httpMethod: RxUrlRequest.HttpMethod) -> Self {
        self.httpMethod = httpMethod
        return self
    }
    
    func set(url: String) -> Self {
        self.url = url
        return self
    }
    
    func set(parameters: RxUrlRequest.Parameters?) -> Self {
        self.parameters = parameters
        return self
    }
    
    /// Set the parameters encoding, `ParametersEncoding.jsonEncoded` by default
    func set(parametersEncoding: RxUrlRequest.ParametersEncoding) -> Self {
        self.parametersEncoding = parametersEncoding
        return self
    }
    
    /// Parameter destination, by default `ParametersDestination.methodDependent`
    func set(parametersDestination: RxUrlRequest.ParametersDestination) -> Self {
        self.parametersDestination = parametersDestination
        return self
    }
    
    func set(preprocessorHeaders: [URLRequestPreprocessor]) -> Self {
        self.preprocessorHeaders = preprocessorHeaders
        return self
    }
    
    func set(analyzers: [RepositoryResponseAnalyzer]) -> Self {
        self.analyzers = analyzers
        return self
    }

    func set(configuration: URLSessionConfiguration) -> Self {
        self.configuration = configuration
        return self
    }

    /// Build a Single instance with the contents given
    func buildSingle() throws -> Single<Data> {
        guard let url = URL(string: self.url ?? "") else { throw BuilderError.pathNotDefined }
        
        let request = RxUrlRequest(
            httpMethod: httpMethod, url: url, parameters: parameters,
            parametersDestination: parametersDestination, parametersEncoding: parametersEncoding,
            urlRequestPreprocessors: preprocessorHeaders, responseAnalyzers: analyzers,
            configuration: configuration)
        
        return BaseNativeRxRepositoryDefault(request: request).single()
    }
    
    /// Build a Completable instance with the contents given
    func buildCompletable() throws -> Completable {
        guard let url = URL(string: self.url ?? "") else { throw BuilderError.pathNotDefined }
        
        let request = RxUrlRequest(
            httpMethod: httpMethod, url: url, parameters: parameters,
            parametersDestination: parametersDestination, parametersEncoding: parametersEncoding,
            urlRequestPreprocessors: preprocessorHeaders, responseAnalyzers: analyzers,
            configuration: configuration)
        
        return BaseNativeRxRepositoryDefault(request: request).completable()
    }
    
    typealias OnSuccess = (Data) -> Void
    typealias OnError = (Error) -> Void
    
    func buildCancelable(onSuccess: @escaping OnSuccess, onError: @escaping OnError) throws -> CancelableRequest {
        guard let url = URL(string: self.url ?? "") else { throw BuilderError.pathNotDefined }
        
        let request = RxUrlRequest(
            httpMethod: httpMethod, url: url, parameters: parameters,
            parametersDestination: parametersDestination, parametersEncoding: parametersEncoding,
            urlRequestPreprocessors: preprocessorHeaders, responseAnalyzers: analyzers,
            configuration: configuration)
        
        return BaseNativeRxRepositoryDefault(request: request).cancelable(onSuccess: onSuccess, onError: onError)
    }
}

struct RxUrlRequest {
    
    /**
     Defines all types of http method
     */
    enum HttpMethod: String {
        case GET, HEAD, POST, PUT, DELETE, CONNECT, OPTIONS, TRACE
    }
    
    /**
     Define the parameters type
     */
    typealias Parameters = [String: Any]
    
    /**
     Defines whether the url-encoded query string is applied to the existing query string or HTTP body of the
     resulting URL request.
     - methodDependent: Applies encoded query string result to existing query string for `GET`, `HEAD` and `DELETE`
     requests and sets as the HTTP body for requests with any other HTTP method.
     - queryString:     Sets or appends encoded query string result to existing query string.
     - httpBody:        Sets encoded query string result as the HTTP body of the URL request.
     */
    enum ParametersDestination {
        case queryString, httpBody
    }
    
    /**
     Defines how parameters will be encoded
     */
    enum ParametersEncoding {
        case urlEncoded, jsonEncoded
    }
    
    let httpMethod: HttpMethod
    let url: URL
    let parameters: Parameters?
    let parametersDestination: ParametersDestination
    let parametersEncoding: ParametersEncoding
    let urlRequestPreprocessors: [URLRequestPreprocessor]
    let responseAnalyzers: [RepositoryResponseAnalyzer]
    let configuration: URLSessionConfiguration
}

private extension ProcessInfo {
    func isXCTestMode() -> Bool {
        #if DEBUG
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
        #else
        return false
        #endif
    }
}
