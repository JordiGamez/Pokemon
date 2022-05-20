
import RxSwift

/**
 Base Rx repository configuration
 */
protocol BaseRxRepository {
    
    /**
     Return a single with the data response of the services
    */
    func single() -> Single<Data>
    
    /**
     Return a completable
    */
    func completable() -> Completable
}
