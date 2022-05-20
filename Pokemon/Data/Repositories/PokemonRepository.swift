
import Foundation
import RxSwift

//sourcery: AutoMockable
protocol PokemonRepository {
    func getList(region: PokemonRegion) -> Single<PokemonListResponse>
    func getDetail(number: String) -> Single<PokemonDetailResponse>
    func getPokemonSpecies(number: String) -> Single<PokemonSpeciesResponse>
    func getPokemonEvolutionChain(number: String) -> Single<PokemonEvolutionChainResponse>
}

class PokemonRepositoryDefault: RxBaseRepository {
    
    override init(configuration: ServerConfiguration,
                  queueProvider: ServiceQueueProvider) {
        super.init(configuration: configuration,
                   queueProvider: queueProvider)
    }
    
    override init(configuration: ServerConfiguration,
                  queueProvider: ServiceQueueProvider,
                  sessionConfiguration: URLSessionConfiguration) {
        super.init(configuration: configuration,
                   queueProvider: queueProvider,
                   sessionConfiguration: sessionConfiguration)
    }
}

extension PokemonRepositoryDefault: PokemonRepository {
    
    func getList(region: PokemonRegion) -> Single<PokemonListResponse> {
        do {
            return try BaseRxRepositoryBuilder()
                .set(url: configuration.api + "/pokemon")
                .set(configuration: sessionConfiguration)
                .set(httpMethod: .GET)
                .set(parameters: buildListParams(region: region).toJson())
                .set(parametersDestination: .queryString)
                .set(parametersEncoding: .urlEncoded)
                .set(preprocessorHeaders: [
                    RepositoryHeaderPreprocessorAcceptApplicationJson(),
                    RepositoryHeaderPreprocessorUrlEncoded()
                ])
                .set(analyzers: [
                    Repository401Analyzer()
                ])
                .buildSingle()
                .map(PokemonListResponseMapper().map)
        } catch let error {
            return .error(error)
        }
    }
    
    func getDetail(number: String) -> Single<PokemonDetailResponse> {
        do {
            return try BaseRxRepositoryBuilder()
                .set(url: configuration.api + "/pokemon/\(number)")
                .set(configuration: sessionConfiguration)
                .set(httpMethod: .GET)
                .set(parametersDestination: .queryString)
                .set(parametersEncoding: .urlEncoded)
                .set(preprocessorHeaders: [
                    RepositoryHeaderPreprocessorAcceptApplicationJson(),
                    RepositoryHeaderPreprocessorUrlEncoded()
                ])
                .set(analyzers: [
                    Repository401Analyzer()
                ])
                .buildSingle()
                .map(PokemonDetailResponseMapper().map)
        } catch let error {
            return .error(error)
        }
    }
    
    func getPokemonSpecies(number: String) -> Single<PokemonSpeciesResponse> {
        do {
            return try BaseRxRepositoryBuilder()
                .set(url: configuration.api + "/pokemon-species/\(number)")
                .set(configuration: sessionConfiguration)
                .set(httpMethod: .GET)
                .set(parametersDestination: .queryString)
                .set(parametersEncoding: .urlEncoded)
                .set(preprocessorHeaders: [
                    RepositoryHeaderPreprocessorAcceptApplicationJson(),
                    RepositoryHeaderPreprocessorUrlEncoded()
                ])
                .set(analyzers: [
                    Repository401Analyzer()
                ])
                .buildSingle()
                .map(PokemonSpeciesResponseMapper().map)
        } catch let error {
            return .error(error)
        }
    }
    
    func getPokemonEvolutionChain(number: String) -> Single<PokemonEvolutionChainResponse> {
        do {
            return try BaseRxRepositoryBuilder()
                .set(url: configuration.api + "/evolution-chain/\(number)")
                .set(configuration: sessionConfiguration)
                .set(httpMethod: .GET)
                .set(parametersDestination: .queryString)
                .set(parametersEncoding: .urlEncoded)
                .set(preprocessorHeaders: [
                    RepositoryHeaderPreprocessorAcceptApplicationJson(),
                    RepositoryHeaderPreprocessorUrlEncoded()
                ])
                .set(analyzers: [
                    Repository401Analyzer()
                ])
                .buildSingle()
                .map(PokemonEvolutionChainResponseMapper().map)
        } catch let error {
            return .error(error)
        }
    }
}

private extension PokemonRepositoryDefault {
    
    func buildListParams(region: PokemonRegion) -> PokemonListRequest {
        .init(region: region)
    }
}
