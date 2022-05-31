import UIKit

class PageViewController: UIViewController {
    var navigator: ScreenNavigator!
    var resolver: ViewControllerResolver!

    /// navigateTo(screen:) is a convenience method to navigate to the specified screen.
    /// - Parameter screen: The screen to navigate to.
    func navigateTo(screen: String) {
        let controller = try! resolver.resolve(forKey: screen)
        navigator.navigate(toController: controller)
    }

    /// navigateBack() is a convenience method to navigate back to the previous screen.
    func navigateBack() {
        navigator.navigateBack()
    }
}

/// extension for applying a resolver and a navigator to a view controller.
extension PageViewController {
    /// Applies the resolver and navigator to the page view controller.
    func applying(resolver: ViewControllerResolver, navigator: ScreenNavigator) -> UIViewController {
        self.resolver = resolver
        self.navigator = navigator
        return self
    }
}
