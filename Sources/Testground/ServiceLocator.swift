import DIUtil

var serviceLocator: PServiceLocator = StandardServiceLocator()


struct Kek: DependenciesSourceProvider { static let dependenciesSource = Self() }
protocol PServiceLocator: DependenciesSourceProvider {
	var services: PServicesDependencies! { get }
}

final class StandardServiceLocator: PServiceLocator {
	var services: PServicesDependencies! = nil //ServicesDependencies()
}

extension StandardServiceLocator {
	static let dependenciesSource = StandardServiceLocator()
}



protocol PServicesDependencies {
	var notifications: PNotificationService { get }
}

class ServicesDependencies: PServicesDependencies {
	var notifications: PNotificationService = NotificationService()
}



protocol PNotificationService {
	func action ()
}

class NotificationService: PNotificationService {
	func action () { }
}
