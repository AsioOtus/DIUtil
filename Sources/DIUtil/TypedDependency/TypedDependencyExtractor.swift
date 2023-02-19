public final class TypedDependencyExtractor <Dependency>: DependencyExtractor {
    public private(set) var container: DIContainer

    public private(set) var local: Dependency?
    public var extracted: Dependency { container[Dependency.self] }
    public var dependency: Dependency {
        get { local ?? extracted }
        set { local = newValue }
    }

    public init (_ container: DIContainer) {
        self.container = container
    }

    public func inject (_ dependency: Dependency) { local = dependency }
    public func deleteLocal () { local = nil }

    public func set (container: DIContainer) { self.container = container }
}
