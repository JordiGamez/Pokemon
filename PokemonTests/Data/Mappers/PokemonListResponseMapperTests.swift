
import XCTest
@testable import Pokemon

class PokemonListResponseMapperTests: XCTestCase {
    
    func test_map_success() {
        let data = Data(bundle: testBundle, jsonName: "pokemon_list_response_success")
        let result = try? PokemonListResponseMapper().map(from: data)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.pokemon.count, 151)
        XCTAssertEqual(result?.pokemon.first?.name, "bulbasaur")
    }
    
    func test_map_error() {
        let data = Data(bundle: testBundle, jsonName: "empty")
        
        XCTAssertThrowsError(try PokemonListResponseMapper().map(from: data))
    }
}
