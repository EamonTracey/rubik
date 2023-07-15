extension Cube {
    public init?(facelets: [Facelet]) {
        guard facelets.count == 54 else { return nil }

        self.corners = Cube.solvedCorners

        guard let upRight = Edge(facelets[5], facelets[19]) else { return nil }
        guard let upLeft = Edge(facelets[3], facelets[28]) else { return nil }
        guard let upFront = Edge(facelets[7], facelets[37]) else { return nil }
        guard let upBack = Edge(facelets[1], facelets[46]) else { return nil }
        guard let downRight = Edge(facelets[14], facelets[25]) else { return nil }
        guard let downLeft = Edge(facelets[12], facelets[34]) else { return nil }
        guard let downFront = Edge(facelets[10], facelets[43]) else { return nil }
        guard let downBack = Edge(facelets[16], facelets[52]) else { return nil }
        guard let rightFront = Edge(facelets[41], facelets[21]) else { return nil }
        guard let rightBack = Edge(facelets[48], facelets[23]) else { return nil }
        guard let leftFront = Edge(facelets[39], facelets[32]) else { return nil }
        guard let leftBack = Edge(facelets[50], facelets[30]) else { return nil }

        self.edges = [
            upRight, upLeft, downRight, downLeft,
            upFront, upBack, downFront, downBack,
            rightFront, rightBack, leftFront, leftBack
        ]
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
            self.orientation = .flipped
        case (.front, .right):
            self.solvedPosition = .rightFront
            self.orientation = .correct
        case (.right, .back):
            self.solvedPosition = .rightBack
            self.orientation = .flipped
        case (.back, .right):
            self.solvedPosition = .rightBack
            self.orientation = .correct
        case (.left, .front):
            self.solvedPosition = .leftFront
            self.orientation = .flipped
        case (.front, .left):
            self.solvedPosition = .leftFront
            self.orientation = .correct
        case (.left, .back):
            self.solvedPosition = .leftBack
            self.orientation = .flipped
        case (.back, .left):
            self.solvedPosition = .leftBack
            self.orientation = .correct
        default: return nil
        }
    }
}

extension Cube.Corner {
    init?(_ faceletA: Facelet, _ faceletB: Facelet) {
        return nil
    }
}
