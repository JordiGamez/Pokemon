
import Foundation

protocol Injector: AnyObject {
    func instanceOf<T>(_ type: T.Type) -> T
    func instanceOf<T>(_ type: T.Type, name: String) -> T
    func instanceOf<T, U>(_ type: T.Type, param: U) -> T
}
