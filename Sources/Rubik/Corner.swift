public extension Cube {
    struct Corner {
        public var orientation: Orientation
        public var solvedPosition: Position
    }
}

public extension Cube.Corner {
    enum Orientation: Int {
        case correct = 0
        case clockwise = 1
        case counterclockwise = 2
    }
}

public extension Cube.Corner {
    enum Position: Int, CaseIterable {
        case upRightFront = 0
        case upLeftBack = 1
        case downRightBack = 2
        case downLeftFront = 3
        case upRightBack = 4
        case upLeftFront = 5
        case downRightFront = 6
        case downLeftBack = 7
    }
}

public extension Cube.Corner {
    enum TwistDegree: Int {
        case clockwise = 1
        case counterclockwise = 2
    }
}

public extension Cube.Corner {
    @inlinable
    mutating func twist(_ degree: TwistDegree) {
        self.orientation = Orientation(rawValue: (self.orientation.rawValue + degree.rawValue) % 3)!
    }
}
