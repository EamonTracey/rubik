extension Algorithm {
    public var reversed: Algorithm {
        return Algorithm(turns.reversed().map({ $0.reversed }))
    }
}
