
import XCTest
import SnapshotTesting
@testable import Pokemon

class SpinnerTests: XCTestCase {
    
    var view: Spinner!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_viewSnapshot() {
        assertSnapshot(matching: view, as: .image)
    }
}

private extension SpinnerTests {
    
    func buildClass() {
        view = Spinner(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 50, height: 50))
    }
}
