extension Cube: Equatable {
    public static func == (lhs: Cube, rhs: Cube) -> Bool {
        return lhs.edges == rhs.edges && lhs.corners == rhs.corners
    }
}
