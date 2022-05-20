
import XCTest
import SwiftyMocky
import RxSwift
@testable import Pokemon

class PokemonDetailDomainMapperTests: XCTestCase {
    
    func test_map_success() {
        let pokemonDetailResponse = buildPokemonDetailResponse()
        let model = PokemonDetailDomainMapper.map(pokemonDetailResponse)
        
        XCTAssertEqual(model.number, 25)
        XCTAssertEqual(model.name, "pikachu")
        XCTAssertEqual(model.imageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
        XCTAssertEqual(model.types.count, 1)
        XCTAssertEqual(model.types.first?.name, .electric)
        XCTAssertEqual(model.types.first?.url, "https://pokeapi.co/api/v2/type/13/")
        XCTAssertEqual(model.height, 4)
        XCTAssertEqual(model.weight, 60)
    }
}

private extension PokemonDetailDomainMapperTests {
    
    func buildPokemonDetailResponse() -> PokemonDetailResponse {
        .init(id: 25,
              name: "pikachu",
              sprites: Sprites(other: Other(artwork: Artwork(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"))),
              types: [buildPokemonTypesResponse()],
              height: 4,
              weight: 60,
              stats: [buildPokemonStatsResponse()])
    }
    
    func buildPokemonTypesResponse() -> PokemonTypesResponse {
        .init(type: PokemonTypeResponse(name: .electric,
                                        url: "https://pokeapi.co/api/v2/type/13/"))
    }
    
    func buildPokemonStatsResponse() -> PokemonStatsResponse {
        .init(value: 50, stat: buildPPokemonStatResponse())
    }
    
    func buildPPokemonStatResponse() -> PokemonStatResponse {
        .init(name: "speed")
    }
}
