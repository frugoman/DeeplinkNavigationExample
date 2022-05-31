import UIKit

protocol ViewControllerRegistry {
    func register(forKey key: String, viewController provider: @escaping () -> UIViewController)
    func viewController(forKey key: String) -> UIViewController?
}
