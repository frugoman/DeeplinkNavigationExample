class ProfileViewControllerRegistrator: ViewControllerRegistrator {
    let registry: ViewControllerRegistry
    let navigator: ScreenNavigator
    let resolver: ViewControllerResolver
    
    init(registry: ViewControllerRegistry, navigator: ScreenNavigator, resolver: ViewControllerResolver) {
        self.registry = registry
        self.navigator = navigator
        self.resolver = resolver
    }
    
    func register() {
        registry.register(forKey: "Profile") { [resolver, navigator] in
            ProfileViewController()
                .applying(resolver: resolver, navigator: navigator)
        }
    }
}
