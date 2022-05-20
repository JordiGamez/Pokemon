
import Foundation
import RxSwift

class BaseNativeRxRepositoryDefault: BaseRxRepository {
    
    private let request: RxUrlRequest
    private var dataTask: URLSessionDataTask?
    
    init(request: RxUrlRequest) {
        self.request = request
    }
    
    func single() -> Single<Data> {
        Single.create(subscribe: { single -> Disposable in
            let cancelable = self.executeBody(onSuccess: { (data) in
                single(.success(data))
            }, onError: { (error) in
                single(.failure(error))
            })
            
            return Disposables.create {
                cancelable.cancel()
            }
        })
    }
    
    func completable() -> Completable {
        Completable.create(subscribe: { completable -> Disposable in
            let cancelable = self.executeBody(onSuccess: { _ in
                completable(.completed)
            }, onError: { (error) in
                completable(.error(error))
            })
            
            return Disposables.create {
                cancelable.cancel()
            }
        })
    }
    
    func cancelable(onSuccess: @escaping OnSuccess, onError: @escaping OnError) -> CancelableRequest {
        executeBody(onSuccess: onSuccess, onError: onError)
    }
    
    typealias OnSuccess = (Data) -> Void
    typealias OnError = (Error) -> Void
    
    @discardableResult
    private func executeBody(onSuccess: @escaping OnSuccess, onError: @escaping OnError) -> Cancelable {
        let session = URLSession(configuration: request.configuration)
        var urlRequest = URLRequest(url: request.url, cachePolicy: .reloadIgnoringLocalCacheData)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        request.urlRequestPreprocessors.forEach { (preprocessor) in
            preprocessor.update(request: &urlRequest)
        }
        
        let encoder = RxParameterEncoderBuilder.createEncoder(for: request)
        encoder.encode(rxRequest: request, into: &urlRequest)
        
        let dataTask = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            defer { self.dataTask = nil }
            
            if let error = error {
                onError(error)
                return
            }

            self.request.responseAnalyzers.forEach({ (analyzer) in
                do {
                    try analyzer.analyze(response: urlResponse, content: data, error: error)
                } catch {
                    onError(error)
                    return
                }
            })
            
            onSuccess(data ?? Data())
        }
        
        dataTask.resume()
        self.dataTask = dataTask
        return Cancelable(task: dataTask)
    }
}

private class Cancelable: CancelableRequest {
    
    private weak var task: URLSessionDataTask?
    
    init(task: URLSessionDataTask) {
        self.task = task
    }
    
    func cancel() {
        task?.cancel()
    }
}
