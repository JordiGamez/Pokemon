
import XCTest
import SwiftyMocky
import RxSwift
import RxBlocking
@testable import Pokemon

class PokemonRepositoryTests: XCTestCase {
    
    // Class
    private var repository: PokemonRepository!
    
    // Mocks
    private let serverConfiguration = ServerConfigurationDefault()
    private let queueProvider = ServiceQueueProviderDefault()
    private let sessionConfiguration = URLSessionConfiguration.default
    
    override func setUp() {
        super.setUp()
        buildMocks()
        buildClass()
    }
    
    override func tearDown() {
        super.tearDown()
        sessionConfiguration.protocolClasses = nil
    }
    
    func test_getList_kanto_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=151&offset=0", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .kanto).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_johto_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=100&offset=151", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .johto).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_hoenn_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=135&offset=251", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .hoenn).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_sinnoh_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=108&offset=386", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .sinnoh).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_unova_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=155&offset=494", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .unova).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_kalos_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=72&offset=649", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .kalos).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_alola_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=88&offset=721", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .alola).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_galar_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=317&offset=809", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_list_response_success"))
        }
        
        let result = try? repository.getList(region: .galar).toBlocking().first()
        
        XCTAssertEqual(result?.pokemon.count, 151)
    }
    
    func test_getList_error() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon?limit=151&offset=0", request.url?.absoluteString)
            return .data(data: Data())
        }
        
        let result = try? repository.getList(region: .kanto).toBlocking().first()
        
        XCTAssertNil(result)
    }
    
    func test_getDetail_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon/25", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_detail_response_success"))
        }
        
        let result = try? repository.getDetail(number: "25").toBlocking().first()
        
        XCTAssertEqual(result?.id, 25)
    }
    
    func test_getDetail_error() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon/25", request.url?.absoluteString)
            return .data(data: Data())
        }
        
        let result = try? repository.getDetail(number: "25").toBlocking().first()
        
        XCTAssertNil(result)
    }
    
    func test_getPokemonSpecies_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon-species/25", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_species_response_success"))
        }
        
        let result = try? repository.getPokemonSpecies(number: "25").toBlocking().first()
        
        XCTAssertEqual(result?.evolutionChainId, "10")
    }
    
    func test_getPokemonSpecies_error() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/pokemon-species/25", request.url?.absoluteString)
            return .data(data: Data())
        }
        
        let result = try? repository.getPokemonSpecies(number: "25").toBlocking().first()
        
        XCTAssertNil(result)
    }
    
    func test_getPokemonEvolutionChain_success() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/evolution-chain/10", request.url?.absoluteString)
            return .data(data: Data(bundle: self.testBundle, jsonName: "pokemon_evolution_chain_response_success"))
        }
        
        let result = try? repository.getPokemonEvolutionChain(number: "10").toBlocking().first()
        
        XCTAssertEqual(result?.initialFormId, "172")
        XCTAssertEqual(result?.firstEvolutionId, "25")
        XCTAssertEqual(result?.secondEvolutionId, "26")
    }
    
    func test_getPokemonEvolutionChain_error() {
        URLMockProtocol.requestHandler = { request in
            XCTAssertEqual("https://pokeapi.co/api/v2/evolution-chain/10", request.url?.absoluteString)
            return .data(data: Data())
        }
        
        let result = try? repository.getPokemonEvolutionChain(number: "10").toBlocking().first()
        
        XCTAssertNil(result)
    }
}

private extension PokemonRepositoryTests {
    
    func buildMocks() {
        sessionConfiguration.protocolClasses = [URLMockProtocol.self]
    }
    
    func buildClass() {
        repository = PokemonRepositoryDefault(configuration: serverConfiguration,
                                              queueProvider: queueProvider,
                                              sessionConfiguration: sessionConfiguration)
    }
}
