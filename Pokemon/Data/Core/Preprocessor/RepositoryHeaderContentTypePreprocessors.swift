
import Foundation

/**
 Return application/json Accept http header
 */
class RepositoryHeaderPreprocessorAcceptApplicationJson: RepositoryHeaderPreprocessorBase {
    override func headers() -> [String: String] {
        [
            "Accept": "application/json"
        ]
    }
}

/**
 Return application/json Content-Type http header
 */
class RepositoryHeaderPreprocessorApplicationJson: RepositoryHeaderPreprocessorBase {
    override func headers() -> [String: String] {
        [
            "Content-Type": "application/json"
        ]
    }
}

/**
 Return application/x-www-form-urlencoded Content-Type http header
 */
class RepositoryHeaderPreprocessorUrlEncoded: RepositoryHeaderPreprocessorBase {
    override func headers() -> [String: String] {
        [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
    }
}

/**
 Return any Accept content http header
 */
class RepositoryHeaderPreprocessorAcceptApplicationAny: RepositoryHeaderPreprocessorBase {
    override func headers() -> [String: String] {
        [
            "Accept": "*/*"
        ]
    }
}
