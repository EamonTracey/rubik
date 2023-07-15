extension Cube {
    public init?(facelets: [Facelet]) {
        guard facelets.count == 54 else { return nil }

        // TODO: Implement
        self = .solvedCube
    }
}

public enum Facelet {
    case up
    case down
    case right
    case left
    case front
    case back
}

extension Cube.Edge {
    init?(_ faceletA: Facelet, _ faceletB: Facelet) {
        switch (faceletA, faceletB) {
        case (.up, .right):
            self.solvedPosition = .upRight
            self.orientation = .correct
        case (.right, .up):
            self.solvedPosition = .upRight
            self.orientation = .flipped
        case (.up, .left):
            self.solvedPosition = .upLeft
            self.orientation = .correct
        case (.left, .up):
            self.solvedPosition = .upLeft
            self.orientation = .flipped
        case (.up, .front):
            self.solvedPosition = .upFront
            self.orientation = .correct
        case (.front, .up):
            self.solvedPosition = .upFront
            self.orientation = .flipped
        case (.up, .back):
            self.solvedPosition = .upBack
            self.orientation = .correct
        case (.back, .up):
            self.solvedPosition = .upBack
            self.orientation = .flipped
        case (.down, .right):
            self.solvedPosition = .downRight
            self.orientation = .correct
        case (.right, .down):
            self.solvedPosition = .downRight
            self.orientation = .flipped
        case (.down, .left):
            self.solvedPosition = .downLeft
            self.orientation = .correct
        case (.left, .down):
            self.solvedPosition = .downLeft
            self.orientation = .flipped
        case (.down, .front):
            self.solvedPosition = .downFront
            self.orientation = .correct
        case (.front, .down):
            self.solvedPosition = .downFront
            self.orientation = .flipped
        case (.down, .back):
            self.solvedPosition = .downBack
            self.orientation = .correct
        case (.back, .down):
            self.solvedPosition = .downBack
            self.orientation = .flipped
        case (.right, .front):
            self.solvedPosition = .rightFront
            self.orientation = .correct
        case (.front, .right):
            self.solvedPosition = .rightFront
            self.orientation = .flipped
        case (.right, .back):
            self.solvedPosition = .rightBack
            self.orientation = .correct
        case (.back, .right):
            self.solvedPosition = .rightBack
            self.orientation = .flipped
        case (.left, .front):
            self.solvedPosition = .leftFront
            self.orientation = .correct
        case (.front, .left):
            self.solvedPosition = .leftFront
            self.orientation = .flipped
        case (.left, .back):
            self.solvedPosition = .leftBack
            self.orientation = .correct
        case (.back, .left):
            self.solvedPosition = .leftBack
            self.orientation = .flipped
        default: return nil
        }
    }
}
