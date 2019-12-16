import UIKit

final class AppCoordinator: BaseCoordinator {
    private let router: Router
    private let coordinatorFactory: CoordinatorFactory
    
    init(window: UIWindow, coordinatorFactory: CoordinatorFactory) {
        let navigationController = UINavigationController()
        
        self.coordinatorFactory = coordinatorFactory
        
        router = RouterImp(rootController: navigationController)
        window.rootViewController = navigationController
    }
    
    override func start() {
        runFlow()
    }
    
    private func runFlow() {
        let coordinator = coordinatorFactory.makeTabContainerCoordinator(router: router)
        
        coordinator.onFinishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
            self?.start()
        }
        
        addDependency(coordinator)
        coordinator.start()
    }

}
