extension Cube: Equatable {
    /// Check the equality of two cubes.
    ///
    /// This checks for equality between the cube's edges and corners.
    public static func == (lhs: Cube, rhs: Cube) -> Bool {
        return lhs.edges == rhs.edges && lhs.corners == rhs.corners
    }
}
