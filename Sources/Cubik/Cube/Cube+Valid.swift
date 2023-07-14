extension Cube {
    /// Determine if a cube's edges are valid.
    ///
    /// Edge validity implies that the cube has the correct edge cubelets. This means that the ``edges``
    /// array contains exactly 12 cubelets with unique `solvedPosition` values.
    @inlinable
    public var areEdgesValid: Bool {
        let twelveEdges = edges.count == 12
        let uniqueCubelets = Set(edges.map { $0.solvedPosition }).count == 12

        return twelveEdges && uniqueCubelets
    }

    /// Determine if a cube's corners are valid.
    ///
    /// Corner validity implies that the cube has the correct corner cubelets. This means that the
    /// ``corners`` array contains exactly 8 cubelets with unique `solvedPosition` values.
    @inlinable
    public var areCornersValid: Bool {
        let eightCorners = corners.count == 8
        let uniqueCubelets = Set(corners.map { $0.solvedPosition }).count == 8

        return eightCorners && uniqueCubelets
    }

    /// Determine if a cube is valid.
    ///
    /// Cube validity implies that the cube has the correct edge and corner cubelets. This property is
    /// computed through ``areEdgesValid`` and ``areCornersValid``.
    @inlinable
    public var isValid: Bool {
        return areEdgesValid && areCornersValid
    }
}
