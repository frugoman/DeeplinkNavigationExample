import UIKit

/// UINavigationControllerScreenNavigator is a concrete implementation of ScreenNavigator.
/// It uses UINavigationController to navigate between screens.
class UINavigationControllerScreenNavigator: ScreenNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func navigate(toController controller: UIViewController) {
        navigationController.pushViewController(controller, animated: true)
    }
    
    func navigateBack() {
        navigationController.popViewController(animated: true)
    }
}
