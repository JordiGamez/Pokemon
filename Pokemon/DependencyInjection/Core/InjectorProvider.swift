
import Foundation

protocol InjectorProvider {
    
    var injector: Injector { get }
    
    /**
     Inflate the object given by parameter (that conforms InjectionModule) and
     call its method "configure". Inside this method you must include all
     injection yout want to use to share across the app (container will be shared
     between all of them)
     - Parameter moduleType: Type of module to inject
     */
    func add(_ moduleType: InjectorModule.Type) -> Self
    
    /**
     Update the injection that will be resolve for 'type' with 'object' when it
     will be requested to the injector
     */
    func updateInjection<T>(type: T.Type, withObject object: T)
    
    /**
     Update the injection that will be resolve for 'type' with 'object' and 'name'
     when it will be requested to the injector
     */
    func updateInjection<T>(type: T.Type, withName name: String?, withObject object: T)
}
