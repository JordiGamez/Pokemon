
import Foundation

/**
 Define the default host access point for app services
 */
protocol ServerConfiguration {
    var api: String { get }
}

class ServerConfigurationDefault: ServerConfiguration {
    
    var api: String {
        "https://pokeapi.co/api/v2"
    }
}
