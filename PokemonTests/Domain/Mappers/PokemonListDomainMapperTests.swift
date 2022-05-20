
import XCTest
import SwiftyMocky
import RxSwift
@testable import Pokemon

class PokemonListDomainMapperTests: XCTestCase {
    
    func test_map_success() {
        let pokemonListResponse = buildPokemonListResponse()
        let model = PokemonListDomainMapper.map(pokemonListResponse)
        
        XCTAssertEqual(model.pokemon.count, 1)
        XCTAssertEqual(model.pokemon.first?.number, "25")
        XCTAssertEqual(model.pokemon.first?.name, "pikachu")
        XCTAssertEqual(model.pokemon.first?.url, "https://pokeapi.co/api/v2/pokemon/25/")
        XCTAssertEqual(model.pokemon.first?.imageUrl, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
    }
}

private extension PokemonListDomainMapperTests {
    
    func buildPokemonListResponse() -> PokemonListResponse {
        PokemonListResponse(pokemon: [PokemonResponse(name: "pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/")])
    }
}
