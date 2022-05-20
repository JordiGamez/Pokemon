
import XCTest

extension XCTestCase {
    
    var testBundle: Bundle {
        Bundle(for: type(of: self))
    }
}
