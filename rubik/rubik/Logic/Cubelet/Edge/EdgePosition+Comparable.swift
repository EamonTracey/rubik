extension EdgePosition: Comparable {
    static func < (lhs: EdgePosition, rhs: EdgePosition) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
