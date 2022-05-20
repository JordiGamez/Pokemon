// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 4.0.4

import SwiftyMocky
import XCTest
import Foundation
import Kingfisher
import RxSwift
import UIKit
@testable import Pokemon


// MARK: - AddPokemonFavoriteInteractor

open class AddPokemonFavoriteInteractorMock: AddPokemonFavoriteInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(pokemonDetail: PokemonDetailModel) -> Completable {
        addInvocation(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(pokemonDetail: PokemonDetailModel). Use given")
			Failure("Stub return value not specified for execute(pokemonDetail: PokemonDetailModel). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_execute__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__pokemonDetail_pokemonDetail(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__pokemonDetail_pokemonDetail: return ".execute(pokemonDetail:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - EmptyPokemonFavoriteInteractor

open class EmptyPokemonFavoriteInteractorMock: EmptyPokemonFavoriteInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Completable {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetPokemonDetailInteractor

open class GetPokemonDetailInteractorMock: GetPokemonDetailInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(number: String) -> Single<PokemonDetailModel> {
        addInvocation(.m_execute__number_number(Parameter<String>.value(`number`)))
		let perform = methodPerformValue(.m_execute__number_number(Parameter<String>.value(`number`))) as? (String) -> Void
		perform?(`number`)
		var __value: Single<PokemonDetailModel>
		do {
		    __value = try methodReturnValue(.m_execute__number_number(Parameter<String>.value(`number`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(number: String). Use given")
			Failure("Stub return value not specified for execute(number: String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__number_number(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__number_number(let lhsNumber), .m_execute__number_number(let rhsNumber)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNumber, rhs: rhsNumber, with: matcher), lhsNumber, rhsNumber, "number"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__number_number(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__number_number: return ".execute(number:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(number: Parameter<String>, willReturn: Single<PokemonDetailModel>...) -> MethodStub {
            return Given(method: .m_execute__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(number: Parameter<String>, willProduce: (Stubber<Single<PokemonDetailModel>>) -> Void) -> MethodStub {
            let willReturn: [Single<PokemonDetailModel>] = []
			let given: Given = { return Given(method: .m_execute__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<PokemonDetailModel>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(number: Parameter<String>) -> Verify { return Verify(method: .m_execute__number_number(`number`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(number: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_execute__number_number(`number`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetPokemonEvolutionChainInteractor

open class GetPokemonEvolutionChainInteractorMock: GetPokemonEvolutionChainInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(number: String) -> Single<[PokemonDetailModel]> {
        addInvocation(.m_execute__number_number(Parameter<String>.value(`number`)))
		let perform = methodPerformValue(.m_execute__number_number(Parameter<String>.value(`number`))) as? (String) -> Void
		perform?(`number`)
		var __value: Single<[PokemonDetailModel]>
		do {
		    __value = try methodReturnValue(.m_execute__number_number(Parameter<String>.value(`number`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(number: String). Use given")
			Failure("Stub return value not specified for execute(number: String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__number_number(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__number_number(let lhsNumber), .m_execute__number_number(let rhsNumber)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNumber, rhs: rhsNumber, with: matcher), lhsNumber, rhsNumber, "number"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__number_number(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__number_number: return ".execute(number:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(number: Parameter<String>, willReturn: Single<[PokemonDetailModel]>...) -> MethodStub {
            return Given(method: .m_execute__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(number: Parameter<String>, willProduce: (Stubber<Single<[PokemonDetailModel]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[PokemonDetailModel]>] = []
			let given: Given = { return Given(method: .m_execute__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[PokemonDetailModel]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(number: Parameter<String>) -> Verify { return Verify(method: .m_execute__number_number(`number`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(number: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_execute__number_number(`number`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetPokemonFavoriteListInteractor

open class GetPokemonFavoriteListInteractorMock: GetPokemonFavoriteListInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute() -> Single<[PokemonDetailModel]> {
        addInvocation(.m_execute)
		let perform = methodPerformValue(.m_execute) as? () -> Void
		perform?()
		var __value: Single<[PokemonDetailModel]>
		do {
		    __value = try methodReturnValue(.m_execute).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(). Use given")
			Failure("Stub return value not specified for execute(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute, .m_execute): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_execute: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute: return ".execute()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(willReturn: Single<[PokemonDetailModel]>...) -> MethodStub {
            return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(willProduce: (Stubber<Single<[PokemonDetailModel]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[PokemonDetailModel]>] = []
			let given: Given = { return Given(method: .m_execute, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[PokemonDetailModel]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute() -> Verify { return Verify(method: .m_execute)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_execute, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetPokemonListInteractor

open class GetPokemonListInteractorMock: GetPokemonListInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(region: PokemonRegion) -> Single<PokemonListModel> {
        addInvocation(.m_execute__region_region(Parameter<PokemonRegion>.value(`region`)))
		let perform = methodPerformValue(.m_execute__region_region(Parameter<PokemonRegion>.value(`region`))) as? (PokemonRegion) -> Void
		perform?(`region`)
		var __value: Single<PokemonListModel>
		do {
		    __value = try methodReturnValue(.m_execute__region_region(Parameter<PokemonRegion>.value(`region`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(region: PokemonRegion). Use given")
			Failure("Stub return value not specified for execute(region: PokemonRegion). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__region_region(Parameter<PokemonRegion>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__region_region(let lhsRegion), .m_execute__region_region(let rhsRegion)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRegion, rhs: rhsRegion, with: matcher), lhsRegion, rhsRegion, "region"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__region_region(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__region_region: return ".execute(region:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(region: Parameter<PokemonRegion>, willReturn: Single<PokemonListModel>...) -> MethodStub {
            return Given(method: .m_execute__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(region: Parameter<PokemonRegion>, willProduce: (Stubber<Single<PokemonListModel>>) -> Void) -> MethodStub {
            let willReturn: [Single<PokemonListModel>] = []
			let given: Given = { return Given(method: .m_execute__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<PokemonListModel>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(region: Parameter<PokemonRegion>) -> Verify { return Verify(method: .m_execute__region_region(`region`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(region: Parameter<PokemonRegion>, perform: @escaping (PokemonRegion) -> Void) -> Perform {
            return Perform(method: .m_execute__region_region(`region`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GetPokemonSpeciesInteractor

open class GetPokemonSpeciesInteractorMock: GetPokemonSpeciesInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(number: String) -> Single<PokemonSpeciesResponse> {
        addInvocation(.m_execute__number_number(Parameter<String>.value(`number`)))
		let perform = methodPerformValue(.m_execute__number_number(Parameter<String>.value(`number`))) as? (String) -> Void
		perform?(`number`)
		var __value: Single<PokemonSpeciesResponse>
		do {
		    __value = try methodReturnValue(.m_execute__number_number(Parameter<String>.value(`number`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(number: String). Use given")
			Failure("Stub return value not specified for execute(number: String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__number_number(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__number_number(let lhsNumber), .m_execute__number_number(let rhsNumber)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNumber, rhs: rhsNumber, with: matcher), lhsNumber, rhsNumber, "number"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__number_number(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__number_number: return ".execute(number:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(number: Parameter<String>, willReturn: Single<PokemonSpeciesResponse>...) -> MethodStub {
            return Given(method: .m_execute__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(number: Parameter<String>, willProduce: (Stubber<Single<PokemonSpeciesResponse>>) -> Void) -> MethodStub {
            let willReturn: [Single<PokemonSpeciesResponse>] = []
			let given: Given = { return Given(method: .m_execute__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<PokemonSpeciesResponse>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(number: Parameter<String>) -> Verify { return Verify(method: .m_execute__number_number(`number`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(number: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_execute__number_number(`number`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - IsFavoritePokemonInteractor

open class IsFavoritePokemonInteractorMock: IsFavoritePokemonInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(pokemonDetail: PokemonDetailModel) -> Single<Bool> {
        addInvocation(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(pokemonDetail: PokemonDetailModel). Use given")
			Failure("Stub return value not specified for execute(pokemonDetail: PokemonDetailModel). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_execute__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__pokemonDetail_pokemonDetail(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__pokemonDetail_pokemonDetail: return ".execute(pokemonDetail:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PersistentStorage

open class PersistentStorageMock: PersistentStorage, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func retrieveList() -> [PokemonDetailModel]? {
        addInvocation(.m_retrieveList)
		let perform = methodPerformValue(.m_retrieveList) as? () -> Void
		perform?()
		var __value: [PokemonDetailModel]? = nil
		do {
		    __value = try methodReturnValue(.m_retrieveList).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func save(_ pokemon: PokemonDetailModel) throws {
        addInvocation(.m_save__pokemon(Parameter<PokemonDetailModel>.value(`pokemon`)))
		let perform = methodPerformValue(.m_save__pokemon(Parameter<PokemonDetailModel>.value(`pokemon`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemon`)
		do {
		    _ = try methodReturnValue(.m_save__pokemon(Parameter<PokemonDetailModel>.value(`pokemon`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func remove(_ pokemon: PokemonDetailModel) throws {
        addInvocation(.m_remove__pokemon(Parameter<PokemonDetailModel>.value(`pokemon`)))
		let perform = methodPerformValue(.m_remove__pokemon(Parameter<PokemonDetailModel>.value(`pokemon`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemon`)
		do {
		    _ = try methodReturnValue(.m_remove__pokemon(Parameter<PokemonDetailModel>.value(`pokemon`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func clean(for key: StorageKey) {
        addInvocation(.m_clean__for_key(Parameter<StorageKey>.value(`key`)))
		let perform = methodPerformValue(.m_clean__for_key(Parameter<StorageKey>.value(`key`))) as? (StorageKey) -> Void
		perform?(`key`)
    }


    fileprivate enum MethodType {
        case m_retrieveList
        case m_save__pokemon(Parameter<PokemonDetailModel>)
        case m_remove__pokemon(Parameter<PokemonDetailModel>)
        case m_clean__for_key(Parameter<StorageKey>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_retrieveList, .m_retrieveList): return .match

            case (.m_save__pokemon(let lhsPokemon), .m_save__pokemon(let rhsPokemon)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemon, rhs: rhsPokemon, with: matcher), lhsPokemon, rhsPokemon, "_ pokemon"))
				return Matcher.ComparisonResult(results)

            case (.m_remove__pokemon(let lhsPokemon), .m_remove__pokemon(let rhsPokemon)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemon, rhs: rhsPokemon, with: matcher), lhsPokemon, rhsPokemon, "_ pokemon"))
				return Matcher.ComparisonResult(results)

            case (.m_clean__for_key(let lhsKey), .m_clean__for_key(let rhsKey)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher), lhsKey, rhsKey, "for key"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_retrieveList: return 0
            case let .m_save__pokemon(p0): return p0.intValue
            case let .m_remove__pokemon(p0): return p0.intValue
            case let .m_clean__for_key(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_retrieveList: return ".retrieveList()"
            case .m_save__pokemon: return ".save(_:)"
            case .m_remove__pokemon: return ".remove(_:)"
            case .m_clean__for_key: return ".clean(for:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func retrieveList(willReturn: [PokemonDetailModel]?...) -> MethodStub {
            return Given(method: .m_retrieveList, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func retrieveList(willProduce: (Stubber<[PokemonDetailModel]?>) -> Void) -> MethodStub {
            let willReturn: [[PokemonDetailModel]?] = []
			let given: Given = { return Given(method: .m_retrieveList, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([PokemonDetailModel]?).self)
			willProduce(stubber)
			return given
        }
        public static func save(_ pokemon: Parameter<PokemonDetailModel>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_save__pokemon(`pokemon`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func save(_ pokemon: Parameter<PokemonDetailModel>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_save__pokemon(`pokemon`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func remove(_ pokemon: Parameter<PokemonDetailModel>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_remove__pokemon(`pokemon`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func remove(_ pokemon: Parameter<PokemonDetailModel>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_remove__pokemon(`pokemon`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func retrieveList() -> Verify { return Verify(method: .m_retrieveList)}
        public static func save(_ pokemon: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_save__pokemon(`pokemon`))}
        public static func remove(_ pokemon: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_remove__pokemon(`pokemon`))}
        public static func clean(for key: Parameter<StorageKey>) -> Verify { return Verify(method: .m_clean__for_key(`key`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func retrieveList(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_retrieveList, performs: perform)
        }
        public static func save(_ pokemon: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_save__pokemon(`pokemon`), performs: perform)
        }
        public static func remove(_ pokemon: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_remove__pokemon(`pokemon`), performs: perform)
        }
        public static func clean(for key: Parameter<StorageKey>, perform: @escaping (StorageKey) -> Void) -> Perform {
            return Perform(method: .m_clean__for_key(`key`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonDetailPresenter

open class PokemonDetailPresenterMock: PokemonDetailPresenter, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var pokemon: Pokemon? {
		get {	invocations.append(.p_pokemon_get); return __p_pokemon ?? optionalGivenGetterValue(.p_pokemon_get, "PokemonDetailPresenterMock - stub value for pokemon was not defined") }
		set {	invocations.append(.p_pokemon_set(.value(newValue))); __p_pokemon = newValue }
	}
	private var __p_pokemon: (Pokemon)?





    open func loadData() {
        addInvocation(.m_loadData)
		let perform = methodPerformValue(.m_loadData) as? () -> Void
		perform?()
    }

    open func loadFavoriteStatus(pokemonDetail: PokemonDetailModel) {
        addInvocation(.m_loadFavoriteStatus__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_loadFavoriteStatus__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
    }

    open func performFavoriteAction(pokemonDetail: PokemonDetailModel) {
        addInvocation(.m_performFavoriteAction__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_performFavoriteAction__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
    }

    open func share(image: UIImage) {
        addInvocation(.m_share__image_image(Parameter<UIImage>.value(`image`)))
		let perform = methodPerformValue(.m_share__image_image(Parameter<UIImage>.value(`image`))) as? (UIImage) -> Void
		perform?(`image`)
    }


    fileprivate enum MethodType {
        case m_loadData
        case m_loadFavoriteStatus__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)
        case m_performFavoriteAction__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)
        case m_share__image_image(Parameter<UIImage>)
        case p_pokemon_get
		case p_pokemon_set(Parameter<Pokemon?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_loadData, .m_loadData): return .match

            case (.m_loadFavoriteStatus__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_loadFavoriteStatus__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)

            case (.m_performFavoriteAction__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_performFavoriteAction__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)

            case (.m_share__image_image(let lhsImage), .m_share__image_image(let rhsImage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsImage, rhs: rhsImage, with: matcher), lhsImage, rhsImage, "image"))
				return Matcher.ComparisonResult(results)
            case (.p_pokemon_get,.p_pokemon_get): return Matcher.ComparisonResult.match
			case (.p_pokemon_set(let left),.p_pokemon_set(let right)): return Matcher.ComparisonResult([Matcher.ParameterComparisonResult(Parameter<Pokemon?>.compare(lhs: left, rhs: right, with: matcher), left, right, "newValue")])
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_loadData: return 0
            case let .m_loadFavoriteStatus__pokemonDetail_pokemonDetail(p0): return p0.intValue
            case let .m_performFavoriteAction__pokemonDetail_pokemonDetail(p0): return p0.intValue
            case let .m_share__image_image(p0): return p0.intValue
            case .p_pokemon_get: return 0
			case .p_pokemon_set(let newValue): return newValue.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_loadData: return ".loadData()"
            case .m_loadFavoriteStatus__pokemonDetail_pokemonDetail: return ".loadFavoriteStatus(pokemonDetail:)"
            case .m_performFavoriteAction__pokemonDetail_pokemonDetail: return ".performFavoriteAction(pokemonDetail:)"
            case .m_share__image_image: return ".share(image:)"
            case .p_pokemon_get: return "[get] .pokemon"
			case .p_pokemon_set: return "[set] .pokemon"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func pokemon(getter defaultValue: Pokemon?...) -> PropertyStub {
            return Given(method: .p_pokemon_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func loadData() -> Verify { return Verify(method: .m_loadData)}
        public static func loadFavoriteStatus(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_loadFavoriteStatus__pokemonDetail_pokemonDetail(`pokemonDetail`))}
        public static func performFavoriteAction(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_performFavoriteAction__pokemonDetail_pokemonDetail(`pokemonDetail`))}
        public static func share(image: Parameter<UIImage>) -> Verify { return Verify(method: .m_share__image_image(`image`))}
        public static var pokemon: Verify { return Verify(method: .p_pokemon_get) }
		public static func pokemon(set newValue: Parameter<Pokemon?>) -> Verify { return Verify(method: .p_pokemon_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func loadData(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_loadData, performs: perform)
        }
        public static func loadFavoriteStatus(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_loadFavoriteStatus__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
        public static func performFavoriteAction(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_performFavoriteAction__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
        public static func share(image: Parameter<UIImage>, perform: @escaping (UIImage) -> Void) -> Perform {
            return Perform(method: .m_share__image_image(`image`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonDetailRouter

open class PokemonDetailRouterMock: PokemonDetailRouter, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func navigateToShare(image: UIImage) {
        addInvocation(.m_navigateToShare__image_image(Parameter<UIImage>.value(`image`)))
		let perform = methodPerformValue(.m_navigateToShare__image_image(Parameter<UIImage>.value(`image`))) as? (UIImage) -> Void
		perform?(`image`)
    }


    fileprivate enum MethodType {
        case m_navigateToShare__image_image(Parameter<UIImage>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_navigateToShare__image_image(let lhsImage), .m_navigateToShare__image_image(let rhsImage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsImage, rhs: rhsImage, with: matcher), lhsImage, rhsImage, "image"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_navigateToShare__image_image(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_navigateToShare__image_image: return ".navigateToShare(image:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func navigateToShare(image: Parameter<UIImage>) -> Verify { return Verify(method: .m_navigateToShare__image_image(`image`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func navigateToShare(image: Parameter<UIImage>, perform: @escaping (UIImage) -> Void) -> Perform {
            return Perform(method: .m_navigateToShare__image_image(`image`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonDetailView

open class PokemonDetailViewMock: PokemonDetailView, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var wrapperView: UIView {
		get {	invocations.append(.p_wrapperView_get); return __p_wrapperView ?? givenGetterValue(.p_wrapperView_get, "PokemonDetailViewMock - stub value for wrapperView was not defined") }
	}
	private var __p_wrapperView: (UIView)?





    open func showEvolutionChain(model: [PokemonDetailModel]) {
        addInvocation(.m_showEvolutionChain__model_model(Parameter<[PokemonDetailModel]>.value(`model`)))
		let perform = methodPerformValue(.m_showEvolutionChain__model_model(Parameter<[PokemonDetailModel]>.value(`model`))) as? ([PokemonDetailModel]) -> Void
		perform?(`model`)
    }

    open func showAddedToFavorite(pokemonDetail: PokemonDetailModel) {
        addInvocation(.m_showAddedToFavorite__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_showAddedToFavorite__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
    }

    open func showRemovedFromFavorite(pokemonDetail: PokemonDetailModel) {
        addInvocation(.m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
    }

    open func showError() {
        addInvocation(.m_showError)
		let perform = methodPerformValue(.m_showError) as? () -> Void
		perform?()
    }

    open func showSpinner() {
        addInvocation(.m_showSpinner)
		let perform = methodPerformValue(.m_showSpinner) as? () -> Void
		perform?()
    }

    open func hideSpinner() {
        addInvocation(.m_hideSpinner)
		let perform = methodPerformValue(.m_hideSpinner) as? () -> Void
		perform?()
    }

    open func retrieveSpinner() -> Spinner? {
        addInvocation(.m_retrieveSpinner)
		let perform = methodPerformValue(.m_retrieveSpinner) as? () -> Void
		perform?()
		var __value: Spinner? = nil
		do {
		    __value = try methodReturnValue(.m_retrieveSpinner).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func removeSpinner() {
        addInvocation(.m_removeSpinner)
		let perform = methodPerformValue(.m_removeSpinner) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_showEvolutionChain__model_model(Parameter<[PokemonDetailModel]>)
        case m_showAddedToFavorite__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)
        case m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)
        case m_showError
        case m_showSpinner
        case m_hideSpinner
        case m_retrieveSpinner
        case m_removeSpinner
        case p_wrapperView_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_showEvolutionChain__model_model(let lhsModel), .m_showEvolutionChain__model_model(let rhsModel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsModel, rhs: rhsModel, with: matcher), lhsModel, rhsModel, "model"))
				return Matcher.ComparisonResult(results)

            case (.m_showAddedToFavorite__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_showAddedToFavorite__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)

            case (.m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)

            case (.m_showError, .m_showError): return .match

            case (.m_showSpinner, .m_showSpinner): return .match

            case (.m_hideSpinner, .m_hideSpinner): return .match

            case (.m_retrieveSpinner, .m_retrieveSpinner): return .match

            case (.m_removeSpinner, .m_removeSpinner): return .match
            case (.p_wrapperView_get,.p_wrapperView_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_showEvolutionChain__model_model(p0): return p0.intValue
            case let .m_showAddedToFavorite__pokemonDetail_pokemonDetail(p0): return p0.intValue
            case let .m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(p0): return p0.intValue
            case .m_showError: return 0
            case .m_showSpinner: return 0
            case .m_hideSpinner: return 0
            case .m_retrieveSpinner: return 0
            case .m_removeSpinner: return 0
            case .p_wrapperView_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_showEvolutionChain__model_model: return ".showEvolutionChain(model:)"
            case .m_showAddedToFavorite__pokemonDetail_pokemonDetail: return ".showAddedToFavorite(pokemonDetail:)"
            case .m_showRemovedFromFavorite__pokemonDetail_pokemonDetail: return ".showRemovedFromFavorite(pokemonDetail:)"
            case .m_showError: return ".showError()"
            case .m_showSpinner: return ".showSpinner()"
            case .m_hideSpinner: return ".hideSpinner()"
            case .m_retrieveSpinner: return ".retrieveSpinner()"
            case .m_removeSpinner: return ".removeSpinner()"
            case .p_wrapperView_get: return "[get] .wrapperView"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func wrapperView(getter defaultValue: UIView...) -> PropertyStub {
            return Given(method: .p_wrapperView_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func retrieveSpinner(willReturn: Spinner?...) -> MethodStub {
            return Given(method: .m_retrieveSpinner, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func retrieveSpinner(willProduce: (Stubber<Spinner?>) -> Void) -> MethodStub {
            let willReturn: [Spinner?] = []
			let given: Given = { return Given(method: .m_retrieveSpinner, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Spinner?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showEvolutionChain(model: Parameter<[PokemonDetailModel]>) -> Verify { return Verify(method: .m_showEvolutionChain__model_model(`model`))}
        public static func showAddedToFavorite(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_showAddedToFavorite__pokemonDetail_pokemonDetail(`pokemonDetail`))}
        public static func showRemovedFromFavorite(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(`pokemonDetail`))}
        public static func showError() -> Verify { return Verify(method: .m_showError)}
        public static func showSpinner() -> Verify { return Verify(method: .m_showSpinner)}
        public static func hideSpinner() -> Verify { return Verify(method: .m_hideSpinner)}
        public static func retrieveSpinner() -> Verify { return Verify(method: .m_retrieveSpinner)}
        public static func removeSpinner() -> Verify { return Verify(method: .m_removeSpinner)}
        public static var wrapperView: Verify { return Verify(method: .p_wrapperView_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showEvolutionChain(model: Parameter<[PokemonDetailModel]>, perform: @escaping ([PokemonDetailModel]) -> Void) -> Perform {
            return Perform(method: .m_showEvolutionChain__model_model(`model`), performs: perform)
        }
        public static func showAddedToFavorite(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_showAddedToFavorite__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
        public static func showRemovedFromFavorite(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_showRemovedFromFavorite__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
        public static func showError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showError, performs: perform)
        }
        public static func showSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showSpinner, performs: perform)
        }
        public static func hideSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_hideSpinner, performs: perform)
        }
        public static func retrieveSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_retrieveSpinner, performs: perform)
        }
        public static func removeSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_removeSpinner, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonFavoriteListPresenter

open class PokemonFavoriteListPresenterMock: PokemonFavoriteListPresenter, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func loadData() {
        addInvocation(.m_loadData)
		let perform = methodPerformValue(.m_loadData) as? () -> Void
		perform?()
    }

    open func showPokemonDetail(pokemonDetail: PokemonDetailModel) {
        addInvocation(.m_showPokemonDetail__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_showPokemonDetail__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
    }

    open func emptyFavoriteList() {
        addInvocation(.m_emptyFavoriteList)
		let perform = methodPerformValue(.m_emptyFavoriteList) as? () -> Void
		perform?()
    }

    open func close() {
        addInvocation(.m_close)
		let perform = methodPerformValue(.m_close) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_loadData
        case m_showPokemonDetail__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)
        case m_emptyFavoriteList
        case m_close

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_loadData, .m_loadData): return .match

            case (.m_showPokemonDetail__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_showPokemonDetail__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)

            case (.m_emptyFavoriteList, .m_emptyFavoriteList): return .match

            case (.m_close, .m_close): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_loadData: return 0
            case let .m_showPokemonDetail__pokemonDetail_pokemonDetail(p0): return p0.intValue
            case .m_emptyFavoriteList: return 0
            case .m_close: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_loadData: return ".loadData()"
            case .m_showPokemonDetail__pokemonDetail_pokemonDetail: return ".showPokemonDetail(pokemonDetail:)"
            case .m_emptyFavoriteList: return ".emptyFavoriteList()"
            case .m_close: return ".close()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func loadData() -> Verify { return Verify(method: .m_loadData)}
        public static func showPokemonDetail(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_showPokemonDetail__pokemonDetail_pokemonDetail(`pokemonDetail`))}
        public static func emptyFavoriteList() -> Verify { return Verify(method: .m_emptyFavoriteList)}
        public static func close() -> Verify { return Verify(method: .m_close)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func loadData(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_loadData, performs: perform)
        }
        public static func showPokemonDetail(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_showPokemonDetail__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
        public static func emptyFavoriteList(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_emptyFavoriteList, performs: perform)
        }
        public static func close(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_close, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonFavoriteListRouter

open class PokemonFavoriteListRouterMock: PokemonFavoriteListRouter, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func navigateToPokemonDetail(pokemon: Pokemon) {
        addInvocation(.m_navigateToPokemonDetail__pokemon_pokemon(Parameter<Pokemon>.value(`pokemon`)))
		let perform = methodPerformValue(.m_navigateToPokemonDetail__pokemon_pokemon(Parameter<Pokemon>.value(`pokemon`))) as? (Pokemon) -> Void
		perform?(`pokemon`)
    }

    open func dismiss() {
        addInvocation(.m_dismiss)
		let perform = methodPerformValue(.m_dismiss) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_navigateToPokemonDetail__pokemon_pokemon(Parameter<Pokemon>)
        case m_dismiss

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_navigateToPokemonDetail__pokemon_pokemon(let lhsPokemon), .m_navigateToPokemonDetail__pokemon_pokemon(let rhsPokemon)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemon, rhs: rhsPokemon, with: matcher), lhsPokemon, rhsPokemon, "pokemon"))
				return Matcher.ComparisonResult(results)

            case (.m_dismiss, .m_dismiss): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_navigateToPokemonDetail__pokemon_pokemon(p0): return p0.intValue
            case .m_dismiss: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_navigateToPokemonDetail__pokemon_pokemon: return ".navigateToPokemonDetail(pokemon:)"
            case .m_dismiss: return ".dismiss()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func navigateToPokemonDetail(pokemon: Parameter<Pokemon>) -> Verify { return Verify(method: .m_navigateToPokemonDetail__pokemon_pokemon(`pokemon`))}
        public static func dismiss() -> Verify { return Verify(method: .m_dismiss)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func navigateToPokemonDetail(pokemon: Parameter<Pokemon>, perform: @escaping (Pokemon) -> Void) -> Perform {
            return Perform(method: .m_navigateToPokemonDetail__pokemon_pokemon(`pokemon`), performs: perform)
        }
        public static func dismiss(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_dismiss, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonFavoriteListView

open class PokemonFavoriteListViewMock: PokemonFavoriteListView, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func showPokemonList(pokemon: [PokemonDetailModel]) {
        addInvocation(.m_showPokemonList__pokemon_pokemon(Parameter<[PokemonDetailModel]>.value(`pokemon`)))
		let perform = methodPerformValue(.m_showPokemonList__pokemon_pokemon(Parameter<[PokemonDetailModel]>.value(`pokemon`))) as? ([PokemonDetailModel]) -> Void
		perform?(`pokemon`)
    }

    open func reloadFavoriteList() {
        addInvocation(.m_reloadFavoriteList)
		let perform = methodPerformValue(.m_reloadFavoriteList) as? () -> Void
		perform?()
    }

    open func showError() {
        addInvocation(.m_showError)
		let perform = methodPerformValue(.m_showError) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_showPokemonList__pokemon_pokemon(Parameter<[PokemonDetailModel]>)
        case m_reloadFavoriteList
        case m_showError

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_showPokemonList__pokemon_pokemon(let lhsPokemon), .m_showPokemonList__pokemon_pokemon(let rhsPokemon)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemon, rhs: rhsPokemon, with: matcher), lhsPokemon, rhsPokemon, "pokemon"))
				return Matcher.ComparisonResult(results)

            case (.m_reloadFavoriteList, .m_reloadFavoriteList): return .match

            case (.m_showError, .m_showError): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_showPokemonList__pokemon_pokemon(p0): return p0.intValue
            case .m_reloadFavoriteList: return 0
            case .m_showError: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_showPokemonList__pokemon_pokemon: return ".showPokemonList(pokemon:)"
            case .m_reloadFavoriteList: return ".reloadFavoriteList()"
            case .m_showError: return ".showError()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showPokemonList(pokemon: Parameter<[PokemonDetailModel]>) -> Verify { return Verify(method: .m_showPokemonList__pokemon_pokemon(`pokemon`))}
        public static func reloadFavoriteList() -> Verify { return Verify(method: .m_reloadFavoriteList)}
        public static func showError() -> Verify { return Verify(method: .m_showError)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showPokemonList(pokemon: Parameter<[PokemonDetailModel]>, perform: @escaping ([PokemonDetailModel]) -> Void) -> Perform {
            return Perform(method: .m_showPokemonList__pokemon_pokemon(`pokemon`), performs: perform)
        }
        public static func reloadFavoriteList(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_reloadFavoriteList, performs: perform)
        }
        public static func showError(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showError, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonListPresenter

open class PokemonListPresenterMock: PokemonListPresenter, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func loadData(region: PokemonRegion) {
        addInvocation(.m_loadData__region_region(Parameter<PokemonRegion>.value(`region`)))
		let perform = methodPerformValue(.m_loadData__region_region(Parameter<PokemonRegion>.value(`region`))) as? (PokemonRegion) -> Void
		perform?(`region`)
    }

    open func showDetail(pokemon: Pokemon) {
        addInvocation(.m_showDetail__pokemon_pokemon(Parameter<Pokemon>.value(`pokemon`)))
		let perform = methodPerformValue(.m_showDetail__pokemon_pokemon(Parameter<Pokemon>.value(`pokemon`))) as? (Pokemon) -> Void
		perform?(`pokemon`)
    }

    open func navigateToFavorites() {
        addInvocation(.m_navigateToFavorites)
		let perform = methodPerformValue(.m_navigateToFavorites) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_loadData__region_region(Parameter<PokemonRegion>)
        case m_showDetail__pokemon_pokemon(Parameter<Pokemon>)
        case m_navigateToFavorites

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_loadData__region_region(let lhsRegion), .m_loadData__region_region(let rhsRegion)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRegion, rhs: rhsRegion, with: matcher), lhsRegion, rhsRegion, "region"))
				return Matcher.ComparisonResult(results)

            case (.m_showDetail__pokemon_pokemon(let lhsPokemon), .m_showDetail__pokemon_pokemon(let rhsPokemon)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemon, rhs: rhsPokemon, with: matcher), lhsPokemon, rhsPokemon, "pokemon"))
				return Matcher.ComparisonResult(results)

            case (.m_navigateToFavorites, .m_navigateToFavorites): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_loadData__region_region(p0): return p0.intValue
            case let .m_showDetail__pokemon_pokemon(p0): return p0.intValue
            case .m_navigateToFavorites: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_loadData__region_region: return ".loadData(region:)"
            case .m_showDetail__pokemon_pokemon: return ".showDetail(pokemon:)"
            case .m_navigateToFavorites: return ".navigateToFavorites()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func loadData(region: Parameter<PokemonRegion>) -> Verify { return Verify(method: .m_loadData__region_region(`region`))}
        public static func showDetail(pokemon: Parameter<Pokemon>) -> Verify { return Verify(method: .m_showDetail__pokemon_pokemon(`pokemon`))}
        public static func navigateToFavorites() -> Verify { return Verify(method: .m_navigateToFavorites)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func loadData(region: Parameter<PokemonRegion>, perform: @escaping (PokemonRegion) -> Void) -> Perform {
            return Perform(method: .m_loadData__region_region(`region`), performs: perform)
        }
        public static func showDetail(pokemon: Parameter<Pokemon>, perform: @escaping (Pokemon) -> Void) -> Perform {
            return Perform(method: .m_showDetail__pokemon_pokemon(`pokemon`), performs: perform)
        }
        public static func navigateToFavorites(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_navigateToFavorites, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonListRouter

open class PokemonListRouterMock: PokemonListRouter, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func navigateToPokemonDetail(pokemon: Pokemon) {
        addInvocation(.m_navigateToPokemonDetail__pokemon_pokemon(Parameter<Pokemon>.value(`pokemon`)))
		let perform = methodPerformValue(.m_navigateToPokemonDetail__pokemon_pokemon(Parameter<Pokemon>.value(`pokemon`))) as? (Pokemon) -> Void
		perform?(`pokemon`)
    }

    open func navigateToFavorites() {
        addInvocation(.m_navigateToFavorites)
		let perform = methodPerformValue(.m_navigateToFavorites) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_navigateToPokemonDetail__pokemon_pokemon(Parameter<Pokemon>)
        case m_navigateToFavorites

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_navigateToPokemonDetail__pokemon_pokemon(let lhsPokemon), .m_navigateToPokemonDetail__pokemon_pokemon(let rhsPokemon)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemon, rhs: rhsPokemon, with: matcher), lhsPokemon, rhsPokemon, "pokemon"))
				return Matcher.ComparisonResult(results)

            case (.m_navigateToFavorites, .m_navigateToFavorites): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_navigateToPokemonDetail__pokemon_pokemon(p0): return p0.intValue
            case .m_navigateToFavorites: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_navigateToPokemonDetail__pokemon_pokemon: return ".navigateToPokemonDetail(pokemon:)"
            case .m_navigateToFavorites: return ".navigateToFavorites()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func navigateToPokemonDetail(pokemon: Parameter<Pokemon>) -> Verify { return Verify(method: .m_navigateToPokemonDetail__pokemon_pokemon(`pokemon`))}
        public static func navigateToFavorites() -> Verify { return Verify(method: .m_navigateToFavorites)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func navigateToPokemonDetail(pokemon: Parameter<Pokemon>, perform: @escaping (Pokemon) -> Void) -> Perform {
            return Perform(method: .m_navigateToPokemonDetail__pokemon_pokemon(`pokemon`), performs: perform)
        }
        public static func navigateToFavorites(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_navigateToFavorites, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonListView

open class PokemonListViewMock: PokemonListView, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var wrapperView: UIView {
		get {	invocations.append(.p_wrapperView_get); return __p_wrapperView ?? givenGetterValue(.p_wrapperView_get, "PokemonListViewMock - stub value for wrapperView was not defined") }
	}
	private var __p_wrapperView: (UIView)?





    open func showPokemonList(model: PokemonListModel) {
        addInvocation(.m_showPokemonList__model_model(Parameter<PokemonListModel>.value(`model`)))
		let perform = methodPerformValue(.m_showPokemonList__model_model(Parameter<PokemonListModel>.value(`model`))) as? (PokemonListModel) -> Void
		perform?(`model`)
    }

    open func showError(region: PokemonRegion) {
        addInvocation(.m_showError__region_region(Parameter<PokemonRegion>.value(`region`)))
		let perform = methodPerformValue(.m_showError__region_region(Parameter<PokemonRegion>.value(`region`))) as? (PokemonRegion) -> Void
		perform?(`region`)
    }

    open func showSpinner() {
        addInvocation(.m_showSpinner)
		let perform = methodPerformValue(.m_showSpinner) as? () -> Void
		perform?()
    }

    open func hideSpinner() {
        addInvocation(.m_hideSpinner)
		let perform = methodPerformValue(.m_hideSpinner) as? () -> Void
		perform?()
    }

    open func retrieveSpinner() -> Spinner? {
        addInvocation(.m_retrieveSpinner)
		let perform = methodPerformValue(.m_retrieveSpinner) as? () -> Void
		perform?()
		var __value: Spinner? = nil
		do {
		    __value = try methodReturnValue(.m_retrieveSpinner).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func removeSpinner() {
        addInvocation(.m_removeSpinner)
		let perform = methodPerformValue(.m_removeSpinner) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_showPokemonList__model_model(Parameter<PokemonListModel>)
        case m_showError__region_region(Parameter<PokemonRegion>)
        case m_showSpinner
        case m_hideSpinner
        case m_retrieveSpinner
        case m_removeSpinner
        case p_wrapperView_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_showPokemonList__model_model(let lhsModel), .m_showPokemonList__model_model(let rhsModel)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsModel, rhs: rhsModel, with: matcher), lhsModel, rhsModel, "model"))
				return Matcher.ComparisonResult(results)

            case (.m_showError__region_region(let lhsRegion), .m_showError__region_region(let rhsRegion)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRegion, rhs: rhsRegion, with: matcher), lhsRegion, rhsRegion, "region"))
				return Matcher.ComparisonResult(results)

            case (.m_showSpinner, .m_showSpinner): return .match

            case (.m_hideSpinner, .m_hideSpinner): return .match

            case (.m_retrieveSpinner, .m_retrieveSpinner): return .match

            case (.m_removeSpinner, .m_removeSpinner): return .match
            case (.p_wrapperView_get,.p_wrapperView_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_showPokemonList__model_model(p0): return p0.intValue
            case let .m_showError__region_region(p0): return p0.intValue
            case .m_showSpinner: return 0
            case .m_hideSpinner: return 0
            case .m_retrieveSpinner: return 0
            case .m_removeSpinner: return 0
            case .p_wrapperView_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_showPokemonList__model_model: return ".showPokemonList(model:)"
            case .m_showError__region_region: return ".showError(region:)"
            case .m_showSpinner: return ".showSpinner()"
            case .m_hideSpinner: return ".hideSpinner()"
            case .m_retrieveSpinner: return ".retrieveSpinner()"
            case .m_removeSpinner: return ".removeSpinner()"
            case .p_wrapperView_get: return "[get] .wrapperView"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func wrapperView(getter defaultValue: UIView...) -> PropertyStub {
            return Given(method: .p_wrapperView_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func retrieveSpinner(willReturn: Spinner?...) -> MethodStub {
            return Given(method: .m_retrieveSpinner, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func retrieveSpinner(willProduce: (Stubber<Spinner?>) -> Void) -> MethodStub {
            let willReturn: [Spinner?] = []
			let given: Given = { return Given(method: .m_retrieveSpinner, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Spinner?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showPokemonList(model: Parameter<PokemonListModel>) -> Verify { return Verify(method: .m_showPokemonList__model_model(`model`))}
        public static func showError(region: Parameter<PokemonRegion>) -> Verify { return Verify(method: .m_showError__region_region(`region`))}
        public static func showSpinner() -> Verify { return Verify(method: .m_showSpinner)}
        public static func hideSpinner() -> Verify { return Verify(method: .m_hideSpinner)}
        public static func retrieveSpinner() -> Verify { return Verify(method: .m_retrieveSpinner)}
        public static func removeSpinner() -> Verify { return Verify(method: .m_removeSpinner)}
        public static var wrapperView: Verify { return Verify(method: .p_wrapperView_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showPokemonList(model: Parameter<PokemonListModel>, perform: @escaping (PokemonListModel) -> Void) -> Perform {
            return Perform(method: .m_showPokemonList__model_model(`model`), performs: perform)
        }
        public static func showError(region: Parameter<PokemonRegion>, perform: @escaping (PokemonRegion) -> Void) -> Perform {
            return Perform(method: .m_showError__region_region(`region`), performs: perform)
        }
        public static func showSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_showSpinner, performs: perform)
        }
        public static func hideSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_hideSpinner, performs: perform)
        }
        public static func retrieveSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_retrieveSpinner, performs: perform)
        }
        public static func removeSpinner(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_removeSpinner, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - PokemonRepository

open class PokemonRepositoryMock: PokemonRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func getList(region: PokemonRegion) -> Single<PokemonListResponse> {
        addInvocation(.m_getList__region_region(Parameter<PokemonRegion>.value(`region`)))
		let perform = methodPerformValue(.m_getList__region_region(Parameter<PokemonRegion>.value(`region`))) as? (PokemonRegion) -> Void
		perform?(`region`)
		var __value: Single<PokemonListResponse>
		do {
		    __value = try methodReturnValue(.m_getList__region_region(Parameter<PokemonRegion>.value(`region`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getList(region: PokemonRegion). Use given")
			Failure("Stub return value not specified for getList(region: PokemonRegion). Use given")
		}
		return __value
    }

    open func getDetail(number: String) -> Single<PokemonDetailResponse> {
        addInvocation(.m_getDetail__number_number(Parameter<String>.value(`number`)))
		let perform = methodPerformValue(.m_getDetail__number_number(Parameter<String>.value(`number`))) as? (String) -> Void
		perform?(`number`)
		var __value: Single<PokemonDetailResponse>
		do {
		    __value = try methodReturnValue(.m_getDetail__number_number(Parameter<String>.value(`number`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getDetail(number: String). Use given")
			Failure("Stub return value not specified for getDetail(number: String). Use given")
		}
		return __value
    }

    open func getPokemonSpecies(number: String) -> Single<PokemonSpeciesResponse> {
        addInvocation(.m_getPokemonSpecies__number_number(Parameter<String>.value(`number`)))
		let perform = methodPerformValue(.m_getPokemonSpecies__number_number(Parameter<String>.value(`number`))) as? (String) -> Void
		perform?(`number`)
		var __value: Single<PokemonSpeciesResponse>
		do {
		    __value = try methodReturnValue(.m_getPokemonSpecies__number_number(Parameter<String>.value(`number`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPokemonSpecies(number: String). Use given")
			Failure("Stub return value not specified for getPokemonSpecies(number: String). Use given")
		}
		return __value
    }

    open func getPokemonEvolutionChain(number: String) -> Single<PokemonEvolutionChainResponse> {
        addInvocation(.m_getPokemonEvolutionChain__number_number(Parameter<String>.value(`number`)))
		let perform = methodPerformValue(.m_getPokemonEvolutionChain__number_number(Parameter<String>.value(`number`))) as? (String) -> Void
		perform?(`number`)
		var __value: Single<PokemonEvolutionChainResponse>
		do {
		    __value = try methodReturnValue(.m_getPokemonEvolutionChain__number_number(Parameter<String>.value(`number`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPokemonEvolutionChain(number: String). Use given")
			Failure("Stub return value not specified for getPokemonEvolutionChain(number: String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getList__region_region(Parameter<PokemonRegion>)
        case m_getDetail__number_number(Parameter<String>)
        case m_getPokemonSpecies__number_number(Parameter<String>)
        case m_getPokemonEvolutionChain__number_number(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getList__region_region(let lhsRegion), .m_getList__region_region(let rhsRegion)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsRegion, rhs: rhsRegion, with: matcher), lhsRegion, rhsRegion, "region"))
				return Matcher.ComparisonResult(results)

            case (.m_getDetail__number_number(let lhsNumber), .m_getDetail__number_number(let rhsNumber)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNumber, rhs: rhsNumber, with: matcher), lhsNumber, rhsNumber, "number"))
				return Matcher.ComparisonResult(results)

            case (.m_getPokemonSpecies__number_number(let lhsNumber), .m_getPokemonSpecies__number_number(let rhsNumber)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNumber, rhs: rhsNumber, with: matcher), lhsNumber, rhsNumber, "number"))
				return Matcher.ComparisonResult(results)

            case (.m_getPokemonEvolutionChain__number_number(let lhsNumber), .m_getPokemonEvolutionChain__number_number(let rhsNumber)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNumber, rhs: rhsNumber, with: matcher), lhsNumber, rhsNumber, "number"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getList__region_region(p0): return p0.intValue
            case let .m_getDetail__number_number(p0): return p0.intValue
            case let .m_getPokemonSpecies__number_number(p0): return p0.intValue
            case let .m_getPokemonEvolutionChain__number_number(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getList__region_region: return ".getList(region:)"
            case .m_getDetail__number_number: return ".getDetail(number:)"
            case .m_getPokemonSpecies__number_number: return ".getPokemonSpecies(number:)"
            case .m_getPokemonEvolutionChain__number_number: return ".getPokemonEvolutionChain(number:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getList(region: Parameter<PokemonRegion>, willReturn: Single<PokemonListResponse>...) -> MethodStub {
            return Given(method: .m_getList__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getDetail(number: Parameter<String>, willReturn: Single<PokemonDetailResponse>...) -> MethodStub {
            return Given(method: .m_getDetail__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPokemonSpecies(number: Parameter<String>, willReturn: Single<PokemonSpeciesResponse>...) -> MethodStub {
            return Given(method: .m_getPokemonSpecies__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPokemonEvolutionChain(number: Parameter<String>, willReturn: Single<PokemonEvolutionChainResponse>...) -> MethodStub {
            return Given(method: .m_getPokemonEvolutionChain__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getList(region: Parameter<PokemonRegion>, willProduce: (Stubber<Single<PokemonListResponse>>) -> Void) -> MethodStub {
            let willReturn: [Single<PokemonListResponse>] = []
			let given: Given = { return Given(method: .m_getList__region_region(`region`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<PokemonListResponse>).self)
			willProduce(stubber)
			return given
        }
        public static func getDetail(number: Parameter<String>, willProduce: (Stubber<Single<PokemonDetailResponse>>) -> Void) -> MethodStub {
            let willReturn: [Single<PokemonDetailResponse>] = []
			let given: Given = { return Given(method: .m_getDetail__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<PokemonDetailResponse>).self)
			willProduce(stubber)
			return given
        }
        public static func getPokemonSpecies(number: Parameter<String>, willProduce: (Stubber<Single<PokemonSpeciesResponse>>) -> Void) -> MethodStub {
            let willReturn: [Single<PokemonSpeciesResponse>] = []
			let given: Given = { return Given(method: .m_getPokemonSpecies__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<PokemonSpeciesResponse>).self)
			willProduce(stubber)
			return given
        }
        public static func getPokemonEvolutionChain(number: Parameter<String>, willProduce: (Stubber<Single<PokemonEvolutionChainResponse>>) -> Void) -> MethodStub {
            let willReturn: [Single<PokemonEvolutionChainResponse>] = []
			let given: Given = { return Given(method: .m_getPokemonEvolutionChain__number_number(`number`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<PokemonEvolutionChainResponse>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getList(region: Parameter<PokemonRegion>) -> Verify { return Verify(method: .m_getList__region_region(`region`))}
        public static func getDetail(number: Parameter<String>) -> Verify { return Verify(method: .m_getDetail__number_number(`number`))}
        public static func getPokemonSpecies(number: Parameter<String>) -> Verify { return Verify(method: .m_getPokemonSpecies__number_number(`number`))}
        public static func getPokemonEvolutionChain(number: Parameter<String>) -> Verify { return Verify(method: .m_getPokemonEvolutionChain__number_number(`number`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getList(region: Parameter<PokemonRegion>, perform: @escaping (PokemonRegion) -> Void) -> Perform {
            return Perform(method: .m_getList__region_region(`region`), performs: perform)
        }
        public static func getDetail(number: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_getDetail__number_number(`number`), performs: perform)
        }
        public static func getPokemonSpecies(number: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_getPokemonSpecies__number_number(`number`), performs: perform)
        }
        public static func getPokemonEvolutionChain(number: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_getPokemonEvolutionChain__number_number(`number`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - RemovePokemonFavoriteInteractor

open class RemovePokemonFavoriteInteractorMock: RemovePokemonFavoriteInteractor, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func execute(pokemonDetail: PokemonDetailModel) -> Completable {
        addInvocation(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`)))
		let perform = methodPerformValue(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))) as? (PokemonDetailModel) -> Void
		perform?(`pokemonDetail`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>.value(`pokemonDetail`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for execute(pokemonDetail: PokemonDetailModel). Use given")
			Failure("Stub return value not specified for execute(pokemonDetail: PokemonDetailModel). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_execute__pokemonDetail_pokemonDetail(Parameter<PokemonDetailModel>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_execute__pokemonDetail_pokemonDetail(let lhsPokemondetail), .m_execute__pokemonDetail_pokemonDetail(let rhsPokemondetail)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsPokemondetail, rhs: rhsPokemondetail, with: matcher), lhsPokemondetail, rhsPokemondetail, "pokemonDetail"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_execute__pokemonDetail_pokemonDetail(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_execute__pokemonDetail_pokemonDetail: return ".execute(pokemonDetail:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>) -> Verify { return Verify(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func execute(pokemonDetail: Parameter<PokemonDetailModel>, perform: @escaping (PokemonDetailModel) -> Void) -> Perform {
            return Perform(method: .m_execute__pokemonDetail_pokemonDetail(`pokemonDetail`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

