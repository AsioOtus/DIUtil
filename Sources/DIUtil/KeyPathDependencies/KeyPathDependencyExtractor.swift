public final class KeyPathDependencyExtractor <DependenciesSource, Dependency>: DependencyExtractor {
	public private(set) var dependenciesSource: DependenciesSource
	public let keyPath: KeyPath<DependenciesSource, Dependency>

	public private(set) var local: Dependency?
	public var extracted: Dependency { dependenciesSource[keyPath: keyPath] }
	public var dependency: Dependency {
		get { local ?? extracted }
		set { local = newValue }
	}

	public init (
		_ keyPath: KeyPath<DependenciesSource, Dependency>,
		_ dependencies: DependenciesSource
	) {
		self.keyPath = keyPath
		self.dependenciesSource = dependencies
	}

	public func inject (_ dependency: Dependency) { local = dependency }
	public func deleteLocal () { local = nil }

	public func set (dependenciesSource: DependenciesSource) { self.dependenciesSource = dependenciesSource }
}
