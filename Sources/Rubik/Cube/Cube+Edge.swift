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
    public enum Orientation: Int {
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

extension Cube.Edge.Position: Comparable {
    public static func < (lhs: Cube.Edge.Position, rhs: Cube.Edge.Position) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension Cube.Edge {
    enum Slice: CaseIterable {
        case standing, middle, equatorial
    }
}

extension Cube.Edge {
    var slice: Slice {
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
