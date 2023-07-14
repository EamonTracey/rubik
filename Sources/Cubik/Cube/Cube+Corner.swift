extension Cube {
    /// A corner cubelet of a cube.
    ///
    /// There are 8 corner cubelets on a cube.
    public struct Corner: Equatable {
        /// The orientation of a corner cubelet.
        public var orientation: Orientation
        /// The position that corresponds to a corner cubelet's solved state.
        ///
        /// The solved position corresponds to the sticker colors of the edge cubelet.
        ///
        /// - Note: Do not confuse this property with the actual position of a corner. Realize, for
        /// example, that the URF corner cubelet can be in the DFL position. In the context of a cube, the
        /// actual position of a corner is determined by its index in an array.
        public var solvedPosition: Position
    }
}

extension Cube.Corner {
    /// Represents corner orientation.
    ///
    /// There are 3 distinct corner orientations.
    ///
    /// - Note: Corner orientation is relative. The definition of corner orientation is as follows: a corner
    /// cubelet is oriented if and only if it can be turned into its solved state using only U, D, R2, and L2
    /// turns. This means that R, L, F, and B change the orientation of the corners on the respective layer.
    public enum Orientation: Int, CaseIterable {
        case correct, clockwise, counterclockwise
    }
}

extension Cube.Corner {
    /// Represents corner position.
    ///
    /// There are 8 distinct corner positions.
    ///
    /// - Note: Corner "position" is not synonymous with corner "cubelet." Position refers to a fixed part
    /// of the cube while cubelet refers to a specific piece that can move to different positions.
    public enum Position: Int, CaseIterable {
        case upRightFront, upLeftBack, downRightBack, downLeftFront,
             upRightBack, upLeftFront, downRightFront, downLeftBack
    }
}

extension Cube.Corner {
    /// A tetrad of a cube.
    ///
    /// A cube has two tetrads, each comprised of 4 corner positions. The first tetrad contains positions
    /// URF, ULB, DRB, and DLF. The second tetrad contains positions ULF, URB, DRF, and DLB. An
    /// important realization is that only quarter turns can move cubelets from one tetrad into another. Half
    /// turns keep all corner cubelets in the same tetrad as before.
    ///
    /// Tetrads are analogous to edge slices.
    public enum Tetrad: CaseIterable {
        case first, second
    }

    /// The tetrad of a corner cubelet.
    @inlinable
    public var tetrad: Tetrad {
        if solvedPosition.rawValue <= 3 {
            return .first
        }
        return .second
    }
}

extension Cube.Corner {
    /// The degree by which a corner twists.
    public enum TwistDegree: Int, CaseIterable {
        case clockwise = 1
        case counterclockwise = 2
    }

    /// Twist a corner to change its orientation.
    ///
    /// - Parameters:
    ///     - degree: The degree by which to twist the corner.
    @inlinable
    public mutating func twist(_ degree: TwistDegree) {
        orientation = Orientation(rawValue: (orientation.rawValue + degree.rawValue) % 3)!
    }
}

extension Cube.Corner.Position: Comparable {
    /// Compare corner positions using raw values.
    @inlinable
    public static func < (lhs: Cube.Corner.Position, rhs: Cube.Corner.Position) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension Cube.Corner: Comparable {
    /// Compare corners using the raw values of the solved positions.
    @inlinable
    public static func < (lhs: Cube.Corner, rhs: Cube.Corner) -> Bool {
        return lhs.solvedPosition < rhs.solvedPosition
    }
}
