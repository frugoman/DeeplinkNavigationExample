import UIKit

protocol ViewControllerResolver {
    func resolve(forKey key: String) throws -> UIViewController
}
