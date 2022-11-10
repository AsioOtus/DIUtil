public protocol DependencyExtractor {
	associatedtype Dependency

	var local: Dependency? { get }
	var extracted: Dependency { get }
	var dependency: Dependency { get }

	func inject (_ dependency: Dependency)
	func deleteLocal ()
}
