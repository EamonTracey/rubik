public extension Cube {
    /// A corner cubelet of a cube.
    ///
    /// There are 8 corner cubelets on a cube.
    struct Corner: Equatable {
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

public extension Cube.Corner {
    /// Represents corner orientation.
    ///
    /// There are 3 distinct corner orientations.
    ///
    /// - Note: Corner orientation is relative. The definition of corner orientation is as follows: a corner
    /// cubelet is oriented if and only if it can be turned into its solved state using only U, D, R2, and L2
    /// turns. This means that R, L, F, and B change the orientation of the corners on the respective layer.
    enum Orientation: Int {
        /// Correct corner orientation.
        case correct = 0
        /// Clockwise-twisted corner orientation.
        case clockwise = 1
        /// Counterclockwise-twisted corner orientation.
        case counterclockwise = 2
    }
}

public extension Cube.Corner {
    /// Represents corner position.
    ///
    /// There are 8 distinct corner positions.
    ///
    /// - Note: Corner "position" is not synonymous with corner "cubelet." Position refers to a fixed part
    /// of the cube while cubelet refers to a specific piece that can move to different positions.
    enum Position: Int, CaseIterable {
        /// The URF corner.
        case upRightFront = 0
        /// The ULB corner.
        case upLeftBack = 1
        /// The DRB corner.
        case downRightBack = 2
        /// The DLF corner.
        case downLeftFront = 3
        /// The URB corner.
        case upRightBack = 4
        /// The ULF corner.
        case upLeftFront = 5
        /// The DRF corner.
        case downRightFront = 6
        /// The DLB corner.
        case downLeftBack = 7
    }
}

public extension Cube.Corner {
    /// Represents the degree by which a corner twists.
    enum TwistDegree: Int {
        case clockwise = 1
        case counterclockwise = 2
    }
}

public extension Cube.Corner {
    /// Twist a corner to change its orientation.
    @inlinable
    mutating func twist(_ degree: TwistDegree) {
        self.orientation = Orientation(rawValue: (self.orientation.rawValue + degree.rawValue) % 3)!
    }
}
