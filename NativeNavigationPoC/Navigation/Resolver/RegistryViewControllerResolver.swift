import UIKit

class RegistryViewControllerResolver: ViewControllerResolver {
    struct ViewControllerNotFoundError: Error {
        let named: String
    }
    
    let registry: ViewControllerRegistry
    
    init(registry: ViewControllerRegistry) {
        self.registry = registry
    }
    
    func resolve(forKey key: String) throws -> UIViewController {
        guard let controller = registry.viewController(forKey: key) else {
            throw ViewControllerNotFoundError(named: key)
        }
        return controller
    }
}
