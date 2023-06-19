public extension Cube {
    struct Edge {
        public var orientation: Orientation
        public var solvedPosition: Position
    }
}

public extension Cube.Edge {
    enum Orientation: Int {
        case correct = 0
        case flipped = 1
    }
}

public extension Cube.Edge {
    enum Position: Int, CaseIterable {
        case upRight = 0
        case upLeft = 1
        case downRight = 2
        case downLeft = 3
        case upFront = 4
        case upBack = 5
        case downFront = 6
        case downBack = 7
        case rightFront = 8
        case rightBack = 9
        case leftFront = 10
        case leftBack = 11
    }
}

public extension Cube.Edge {
    @inlinable
    mutating func flip() {
        self.orientation = self.orientation == .correct ? .flipped : .correct
    }
}
