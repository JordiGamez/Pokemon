
import Foundation

extension Data {
    
    init(bundle: Bundle, jsonName: String) {
        let url = bundle.url(forResource: jsonName, withExtension: "json")!
        do {
            try self.init(contentsOf: url)
        } catch {
            self.init()
        }
    }
}
