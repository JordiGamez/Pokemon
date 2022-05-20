
import XCTest
@testable import Pokemon

class PokemonDetailResponseMapperTests: XCTestCase {
    
    func test_map_success() {
        let data = Data(bundle: testBundle, jsonName: "pokemon_detail_response_success")
        let result = try? PokemonDetailResponseMapper().map(from: data)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.id, 25)
        XCTAssertEqual(result?.name, "pikachu")
        XCTAssertEqual(result?.sprites.other.artwork.frontDefault, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
        XCTAssertEqual(result?.types.count, 1)
        XCTAssertEqual(result?.types.first?.type.name, .electric)
        XCTAssertEqual(result?.types.first?.type.url, "https://pokeapi.co/api/v2/type/13/")
        XCTAssertEqual(result?.height, 4)
        XCTAssertEqual(result?.weight, 60)
    }
    
    func test_map_error() {
        let data = Data(bundle: testBundle, jsonName: "empty")
        
        XCTAssertThrowsError(try PokemonDetailResponseMapper().map(from: data))
    }
}
