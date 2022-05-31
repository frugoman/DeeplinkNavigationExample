protocol Analytics {
    func track(event: String, parameters: [String: Any]?)
}
