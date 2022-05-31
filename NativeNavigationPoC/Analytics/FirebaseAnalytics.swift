class FirebaseAnalytics: Analytics {
    func track(event: String, parameters: [String : Any]?) {
        let parameters = parameters?.description ?? "nil"
        print("FirebaseAnalytics: track event: \(event) with parameters: \(parameters)")
    }
}
