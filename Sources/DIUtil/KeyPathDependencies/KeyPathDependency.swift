@propertyWrapper
public struct KeyPathDependency <DependenciesSource: DependenciesSourceProvider, Dependency> {
	public private(set) var dependencyExtractor: KeyPathDependencyExtractor<DependenciesSource, Dependency>

	public var wrappedValue: Dependency { dependency }
	public var projectedValue: KeyPathDependency<DependenciesSource, Dependency> { self }
	
	public init (
		_ keyPath: KeyPath<DependenciesSource, Dependency>,
		_ dependenciesSource: DependenciesSource = .dependenciesSource
	) {
		dependencyExtractor = .init(keyPath, dependenciesSource)
	}
}

extension KeyPathDependency: DependencyExtractor {
	public var local: Dependency? { dependencyExtractor.local }
	public var extracted: Dependency { dependencyExtractor.extracted }
	public var dependency: Dependency { dependencyExtractor.dependency }

	public func inject (_ dependency: Dependency) { dependencyExtractor.inject(dependency) }
	public func deleteLocal () { dependencyExtractor.deleteLocal() }
}
