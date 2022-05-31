import UIKit

class AnalyticsScreenNavigatorDecorator: ScreenNavigator {
    private let screenNavigator: ScreenNavigator
    private let analytics: Analytics
    
    init(screenNavigator: ScreenNavigator, analytics: Analytics) {
        self.screenNavigator = screenNavigator
        self.analytics = analytics
    }
    
    func navigate(toController controller: UIViewController) {
        analytics.track(event: "willNavigate", parameters: ["screen": controller.description])
        screenNavigator.navigate(toController: controller)
        analytics.track(event: "didNavigate", parameters: ["screen": controller.description])
    }
    
    func navigateBack() {
        analytics.track(event: "willNavigateBack", parameters: nil)
        screenNavigator.navigateBack()
        analytics.track(event: "didNavigateBack", parameters: nil)
    }
}
