
import Foundation

//sourcery: AutoMockable
protocol PersistentStorage {
    func retrieveList() -> [PokemonDetailModel]?
    func save(_ pokemon: PokemonDetailModel) throws
    func remove(_ pokemon: PokemonDetailModel) throws
    func clean(for key: StorageKey)
}

protocol StorageKey {
    var id: String { get }
}

enum PersistentStorageKey: String, StorageKey {
    
    case pokemonFavoriteList
    
    var id: String {
        rawValue
    }
}

enum StorageError: Error {
    case empty
    case notFound
    case notSaved
}

class PersistentStorageDefault: PersistentStorage {
    
    static let shared = PersistentStorageDefault()
    
    private let userDefaults: UserDefaults
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {
        userDefaults = UserDefaults.standard
    }
    
    func retrieveList() -> [PokemonDetailModel]? {
        guard let data = userDefaults.data(forKey: PersistentStorageKey.pokemonFavoriteList.id) else {
            return nil
        }
        do {
            return try decoder.decode([PokemonDetailModel].self, from: data)
        } catch {
            return nil
        }
    }
    
    func save(_ pokemon: PokemonDetailModel) throws {
        var pokemonList = retrieveList() ?? []
        pokemonList.append(pokemon)
        
        do {
            let data = try encoder.encode(pokemonList)
            userDefaults.set(data, forKey: PersistentStorageKey.pokemonFavoriteList.id)
        } catch {
            throw StorageError.notSaved
        }
    }
    
    func remove(_ pokemon: PokemonDetailModel) throws {
        guard var pokemonList = retrieveList() else {
            throw StorageError.empty
        }
        guard let index = pokemonList.firstIndex(where: { $0 == pokemon }) else {
            throw StorageError.notFound
        }
        
        pokemonList.remove(at: index)
        
        do {
            let data = try encoder.encode(pokemonList)
            userDefaults.set(data, forKey: PersistentStorageKey.pokemonFavoriteList.id)
        } catch {
            throw StorageError.notSaved
        }
    }
    
    func clean(for key: StorageKey) {
        userDefaults.removeObject(forKey: key.id)
    }
}
