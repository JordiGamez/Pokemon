
import Foundation

class RxBaseRepository {
    
    let configuration: ServerConfiguration
    let queueProvider: ServiceQueueProvider
    let sessionConfiguration: URLSessionConfiguration
    
    init(configuration: ServerConfiguration, queueProvider: ServiceQueueProvider) {
        self.configuration = configuration
        self.queueProvider = queueProvider
        self.sessionConfiguration = URLSessionConfiguration.default
    }
    
    init(configuration: ServerConfiguration, queueProvider: ServiceQueueProvider, sessionConfiguration: URLSessionConfiguration) {
        self.configuration = configuration
        self.queueProvider = queueProvider
        self.sessionConfiguration = sessionConfiguration
    }
}
