
import Foundation
import Swinject

class PokemonInjectorProvider: InjectorProvider, Injector {
    
    static let shared: InjectorProvider = PokemonInjectorProvider()
    
    let container = Container()
    
    var injector: Injector {
        return self
    }
    
    typealias Update = (Container) -> Void
    
    // MARK: Add Injectios
    
    func add(_ moduleType: InjectorModule.Type) -> Self {
        let module = moduleType.init()
        module.injector = self
        module.configure(container)
        
        return self
    }
    
    func updateInjection<T>(type: T.Type, withObject object: T) {
        updateInjection(type: type, withName: nil, withObject: object)
    }
    
    func updateInjection<T>(type: T.Type, withName name: String?, withObject object: T) {
        container.register(type, name: name) { _ -> T in
            object
        }
    }
    
    // MARK: Request instances
    
    func instanceOf<T>(_ type: T.Type) -> T {
        guard let instance = container.resolve(type) else {
            let message = "Can't retrieve instance of \(type)"
            print(message)
            fatalError(message)
        }
        return instance
    }
    
    func instanceOf<T>(_ type: T.Type, name: String) -> T {
        guard let instance = container.resolve(type, name: name) else {
            let message = "Can't retrieve instance of \(type) for name \(name)"
            print(message)
            fatalError(message)
        }
        return instance
    }
    
    func instanceOf<T, U>(_ type: T.Type, param: U) -> T {
        guard let instance = container.resolve(type, argument: param) else {
            let message = "Can't retrieve instance of \(type) with param \(param)"
            print(message)
            fatalError(message)
        }
        return instance
    }
}
