import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private lazy var coordinator: AppCoordinator = buildAppCoordinator()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        coordinator.start()
        
        window?.makeKeyAndVisible()
        return true
    }
}

private extension AppDelegate {
    private func buildAppCoordinator() -> AppCoordinator {
        return AppCoordinator(window: window!, coordinatorFactory: CoordinatorFactoryImpl())
    }
}

