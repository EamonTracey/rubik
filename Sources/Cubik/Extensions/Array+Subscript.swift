extension Array where Element == Cube.Edge {
    /// Subscript an edge array using an edge position.
    ///
    /// Using edge position to subscript an array of edges is preferred for readability.
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    ///
    /// // Perform an edge flip on the edge in the LB position.
    /// cube.edges[.leftBack].flip()
    /// ```
    @inlinable
    public subscript(index: Cube.Edge.Position) -> Element {
        get {
            return self[index.rawValue]
        }
        set {
            self[index.rawValue] = newValue
        }
    }
}

extension Array where Element == Cube.Corner {
    /// Subscript a corner array using a corner position.
    ///
    /// Using corner position to subscript an array of corners is preferred for readability.
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    ///
    /// // Perform a corner twist on the corner in the URF position.
    /// cube.edges[.upRightFront].twist(.clockwise)
    /// ```
    @inlinable
    public subscript(index: Cube.Corner.Position) -> Element {
        get {
            return self[index.rawValue]
        }
        set {
            self[index.rawValue] = newValue
        }
    }
}
