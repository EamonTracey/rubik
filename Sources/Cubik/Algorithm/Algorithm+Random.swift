extension Algorithm {
    /// Generate a random algorithm.
    ///
    /// The algorithm generated will have 25 turns, meaning that all possible cube states are possible.
    ///
    /// - Note: Although the randomizer will output a sufficiently random algorithm, it is not guranteed
    /// that all cube states are equally likely. This means it is not WCA compliant.
    public static func random() -> Algorithm {
        return Algorithm((0..<25).map { _ in
            Turn.allCases.randomElement()!
        })
    }
}
