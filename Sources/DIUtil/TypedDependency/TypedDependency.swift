@propertyWrapper
public struct TypedDependency <Dependency> {
	public var dependencyExtractor: TypedDependencyExtractor<Dependency>

	public var wrappedValue: Dependency { dependency }
	public var projectedValue: TypedDependency<Dependency> { self }

	public init (_ container: DIContainer) {
		dependencyExtractor = .init(container)
	}
}

extension TypedDependency: DependencyExtractor {
	public var local: Dependency? { dependencyExtractor.local }
	public var extracted: Dependency { dependencyExtractor.extracted }
	public var dependency: Dependency { dependencyExtractor.dependency }

	public func inject (_ dependency: Dependency) { dependencyExtractor.inject(dependency) }
	public func deleteLocal () { dependencyExtractor.deleteLocal() }
}
