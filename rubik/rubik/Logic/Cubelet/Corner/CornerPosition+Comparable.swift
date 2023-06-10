extension CornerPosition: Comparable {
    static func < (lhs: CornerPosition, rhs: CornerPosition) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
