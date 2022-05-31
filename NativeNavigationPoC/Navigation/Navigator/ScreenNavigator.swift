import UIKit

/// ScreenNavigator abstracts the navigation logic.
protocol ScreenNavigator {
    /// Navigates to the specified screen.
    func navigate(toController controller: UIViewController)
    /// Navigates back to the previous screen.
    func navigateBack()
}
