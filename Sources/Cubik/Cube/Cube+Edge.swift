extension Cube {
    /// An edge cubelet of a cube.
    ///
    /// There are 12 edge cubelets on a cube.
    public struct Edge: Equatable {
        /// The orientation of an edge cubelet.
        public var orientation: Orientation
        /// The position that corresponds to an edge cubelet's solved state.
        ///
        /// The solved position corresponds to the sticker colors of the edge cubelet.
        ///
        /// - Note: Do not confuse this property with the actual position of an edge. Realize, for
        /// example, that the UR edge cubelet can be in the FL position. In the context of a cube, the
        /// actual position of an edge is determined by its index in an array.
        public var solvedPosition: Position
    }
}

extension Cube.Edge {
    /// Represents edge orientation.
    ///
    /// There are 2 distinct edge orientations.
    ///
    /// - Note: Edge orientation is relative. The definition of edge orientation is as follows: an edge
    /// cubelet is oriented if and only if it can be turned into its solved state using only U, D, R, and L turns.
    /// This means that F and B toggle the orientation of the edges on the respective layer.
    public enum Orientation: Int, CaseIterable {
        case correct, flipped
    }
}

extension Cube.Edge {
    /// Represents edge position.
    ///
    /// There are 12 distinct edge positions.
    ///
    /// - Note: Edge "position" is not synonymous with edge "cubelet." Position refers to a fixed part of
    /// the cube while cubelet refers to a specific piece that can move to different positions.
    public enum Position: Int, CaseIterable {
        case upRight, upLeft, downRight, downLeft,
             upFront, upBack, downFront, downBack,
             rightFront, rightBack, leftFront, leftBack
    }
}

extension Cube.Edge {
    /// A slice of a cube.
    ///
    /// A cube has thee slice tetrads, each comprised of 4 edge positions. The standing slice contains
    /// positions UR, UL, DR, and DL. The middle slice contains positions UF, UB, DF, DB. The equatorial
    /// slice contains positions RF, RB, LF, LB.  An important realization is that only quarter turns can move
    /// cubelets from one slice into another. Halfturns keep all edge cubelets in the same slice as before.
    ///
    /// Slices are analogous to corner tetrads.
    public enum Slice: CaseIterable {
        case standing, middle, equatorial
    }

    /// The slice of an edge cubelet.
    @inlinable
    public var slice: Slice {
        if solvedPosition.rawValue <= 3 {
            return .standing
        } else if solvedPosition.rawValue <= 7 {
            return .middle
        }
        return .equatorial
    }
}

extension Cube.Edge {
    /// Flip the orientation of an edge cubelet.
    @inlinable
    public mutating func flip() {
        orientation = orientation == .correct ? .flipped : .correct
    }
}

extension Cube.Edge.Position: Comparable {
    /// Compare edge positions using raw values.
    @inlinable
    public static func < (lhs: Cube.Edge.Position, rhs: Cube.Edge.Position) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension Cube.Edge: Comparable {
    /// Compare edge using the raw values of the solved positions.
    @inlinable
    public static func < (lhs: Cube.Edge, rhs: Cube.Edge) -> Bool {
        return lhs.solvedPosition < rhs.solvedPosition
    }
}
