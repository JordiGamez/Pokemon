
import XCTest
import SnapshotTesting
@testable import Pokemon

class SelectorViewTests: XCTestCase {
    
    var view: SelectorView!
    
    override func setUp() {
        super.setUp()
        buildClass()
    }
    
    func test_selector_view_kanto() {
        select(position: 0)
        
        assertSnapshot(matching: view, as: .image)
    }
    
    func test_selector_view_johto() {
        select(position: 1)
        
        assertSnapshot(matching: view, as: .image)
    }
    
    func test_selector_view_hoenn() {
        select(position: 2)
        
        assertSnapshot(matching: view, as: .image)
    }
    
    func test_selector_view_sinnoh() {
        select(position: 3)
        
        assertSnapshot(matching: view, as: .image)
    }
    
    func test_selector_view_unova() {
        select(position: 4)
        
        assertSnapshot(matching: view, as: .image)
    }
}

private extension SelectorViewTests {
    
    func buildClass() {
        view = SelectorView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        view.configure(options: PokemonRegion.allCases.map({ $0.rawValue }))
    }
    
    func select(position: Int) {
        view.select(position)
    }
}
