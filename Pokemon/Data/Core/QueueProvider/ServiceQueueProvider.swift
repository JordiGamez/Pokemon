
import Foundation

/**
 Interface that return some queues to perform app working
 */
protocol ServiceQueueProvider {
    
    /**
     Return a working background queue
    */
    var backgroundQueue: DispatchQueue { get }
}

class ServiceQueueProviderDefault: ServiceQueueProvider {
    
    init() {}
    
    var backgroundQueue: DispatchQueue {
        DispatchQueue.global(qos: .utility)
    }
}
