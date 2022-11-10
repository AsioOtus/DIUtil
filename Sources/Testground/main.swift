import DIUtil

typealias ProjectDependency<DS: PServiceLocator, D> = KeyPathDependency<DS, D>
typealias Dependency<D> = ProjectDependency<StandardServiceLocator, D>

class ViewModelB {
	@Dependency(\.services.notifications) var service: PNotificationService
}

let vmB = ViewModelB()
vmB.service.action()

vmB.$service.inject(NotificationService())
vmB.service.action()





extension ViewModelA {
	struct Dependencies {
		var service: NotificationService
	}
}

class ViewModelA {
	var d: Dependencies

	init (dependencies: Dependencies) {
		self.d = dependencies
	}

	func set (dependencies: Dependencies) {
		d = dependencies
	}

	func action () {
		d.service.action()
	}
}

let vmA = ViewModelA(dependencies: .init(service: NotificationService()))

vmA.set(dependencies: .init(service: NotificationService()))
