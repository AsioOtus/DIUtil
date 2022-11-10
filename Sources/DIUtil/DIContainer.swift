public protocol DIContainer {
    func resolve <PD, D> (_: PD.Type) -> D
    func register <PD, D> (_: PD.Type, _: D)
}

public extension DIContainer {
    subscript <PD, D> (_: PD.Type = PD.self) -> D {
        get { resolve(PD.self) }
        set { register(PD.self, newValue) }
    }
}
