
import Foundation
import Swinject

class InjectorModule: Injector {
    
    weak var injector: Injector?
    
    required init() {}
    
    func configure(_ container: Container) {}
    
    func instanceOf<T>(_ type: T.Type) -> T {
        guard let injector = self.injector else {
            fatalError("Injector is nil")
        }
        
        return injector.instanceOf(type)
    }
    
    func instanceOf<T>(_ type: T.Type, name: String) -> T {
        guard let injector = self.injector else {
            fatalError("Injector is nil")
        }
        
        return injector.instanceOf(type, name: name)
    }
    
    func instanceOf<T, U>(_ type: T.Type, param: U) -> T {
        guard let injector = self.injector else {
            fatalError("Injector is nil")
        }
        
        return injector.instanceOf(type, param: param)
    }
}
