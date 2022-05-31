class FlightViewControllerRegistrator: ViewControllerRegistrator {
    let registry: ViewControllerRegistry
    let navigator: ScreenNavigator
    let resolver: ViewControllerResolver
    
    init(registry: ViewControllerRegistry, navigator: ScreenNavigator, resolver: ViewControllerResolver) {
        self.registry = registry
        self.navigator = navigator
        self.resolver = resolver
    }
    
    func register() {
        registry.register(forKey: "FlightsList") { [resolver, navigator] in
            FlightsViewController()
                .applying(resolver: resolver, navigator: navigator)
        }
        registry.register(forKey: "FlightDetails") { [resolver, navigator] in
            FlightDetailsViewController()
                .applying(resolver: resolver, navigator: navigator)
        }
    }
}
