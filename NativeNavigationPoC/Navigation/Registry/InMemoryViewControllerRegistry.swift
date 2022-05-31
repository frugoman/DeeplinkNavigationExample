import UIKit

class InMemoryViewControllerRegistry: ViewControllerRegistry {
    private var providers: [String: () -> UIViewController] = [:]
    
    func register(forKey key: String, viewController provider: @escaping () -> UIViewController) {
        providers[key] = provider
    }
    
    func viewController(forKey key: String) -> UIViewController? {
        return providers[key]?()
    }
}
