class ViewControllerRegistratorComposer: ViewControllerRegistrator {
    let registry: ViewControllerRegistry
    let navigator: ScreenNavigator
    let resolver: ViewControllerResolver
    
    init(registry: ViewControllerRegistry, navigator: ScreenNavigator, resolver: ViewControllerResolver) {
        self.registry = registry
        self.navigator = navigator
        self.resolver = resolver
    }
    
    func register() {
        let registrators: [ViewControllerRegistrator] = [
            FlightViewControllerRegistrator(registry: registry, navigator: navigator, resolver: resolver),
            ProfileViewControllerRegistrator(registry: registry, navigator: navigator, resolver: resolver)
        ]
        registrators.forEach { $0.register() }
    }
}
