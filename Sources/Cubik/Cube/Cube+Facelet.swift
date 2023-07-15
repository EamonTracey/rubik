extension Cube {
    public init?(facelets: [Facelet]) {
        guard facelets.count == 54 else { return nil }

        guard let upRight = Edge(facelets[5], facelets[19]) else { return nil }
        guard let upLeft = Edge(facelets[3], facelets[28]) else { return nil }
        guard let downRight = Edge(facelets[14], facelets[25]) else { return nil }
        guard let downLeft = Edge(facelets[12], facelets[34]) else { return nil }
        guard let upFront = Edge(facelets[7], facelets[37]) else { return nil }
        guard let upBack = Edge(facelets[1], facelets[46]) else { return nil }
        guard let downFront = Edge(facelets[10], facelets[43]) else { return nil }
        guard let downBack = Edge(facelets[16], facelets[52]) else { return nil }
        guard let rightFront = Edge(facelets[41], facelets[21]) else { return nil }
        guard let rightBack = Edge(facelets[48], facelets[23]) else { return nil }
        guard let leftFront = Edge(facelets[39], facelets[32]) else { return nil }
        guard let leftBack = Edge(facelets[50], facelets[30]) else { return nil }

        guard let upRightFront = Corner(facelets[8], facelets[38], facelets[18]) else { return nil }
        guard let upLeftBack = Corner(facelets[0], facelets[47], facelets[27]) else { return nil }
        guard let downRightBack = Corner(facelets[17], facelets[51], facelets[26]) else { return nil }
        guard let downLeftFront = Corner(facelets[9], facelets[42], facelets[35]) else { return nil }
        guard let upRightBack = Corner(facelets[2], facelets[45], facelets[20]) else { return nil }
        guard let upLeftFront = Corner(facelets[6], facelets[36], facelets[29]) else { return nil }
        guard let downRightFront = Corner(facelets[11], facelets[44], facelets[24]) else { return nil }
        guard let downLeftBack = Corner(facelets[15], facelets[53], facelets[33]) else { return nil }

        self.edges = [
            upRight, upLeft, downRight, downLeft,
            upFront, upBack, downFront, downBack,
            rightFront, rightBack, leftFront, leftBack
        ]

        self.corners = [
            upRightFront, upLeftBack, downRightBack, downLeftFront,
            upRightBack, upLeftFront, downRightFront, downLeftBack
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
    init?(_ faceletA: Facelet, _ faceletB: Facelet, _ faceletC: Facelet) {
        switch (faceletA, faceletB, faceletC) {
        case (.up, .front, .right), (.up, .right, .front):
            self.solvedPosition = .upRightFront
            self.orientation = .correct
        case (.front, .right, .up), (.right, .front, .up):
            self.solvedPosition = .upRightFront
            self.orientation = .counterclockwise
        case (.right, .up, .front), (.front, .up, .right):
            self.solvedPosition = .upRightFront
            self.orientation = .clockwise
        case (.up, .back, .right), (.up, .right, .back):
            self.solvedPosition = .upRightBack
            self.orientation = .correct
        case (.back, .right, .up), (.right, .back, .up):
            self.solvedPosition = .upRightBack
            self.orientation = .clockwise
        case (.right, .up, .back), (.back, .up, .right):
            self.solvedPosition = .upRightBack
            self.orientation = .counterclockwise
        case (.up, .front, .left), (.up, .left, .front):
            self.solvedPosition = .upLeftFront
            self.orientation = .correct
        case (.front, .left, .up), (.left, .front, .up):
            self.solvedPosition = .upLeftFront
            self.orientation = .clockwise
        case (.left, .up, .front), (.front, .up, .left):
            self.solvedPosition = .upLeftFront
            self.orientation = .counterclockwise
        case (.up, .back, .left), (.up, .left, .back):
            self.solvedPosition = .upLeftBack
            self.orientation = .correct
        case (.back, .left, .up), (.left, .back, .up):
            self.solvedPosition = .upLeftBack
            self.orientation = .counterclockwise
        case (.left, .up, .back), (.back, .up, .left):
            self.solvedPosition = .upLeftBack
            self.orientation = .clockwise
        case (.down, .front, .right), (.down, .right, .front):
            self.solvedPosition = .downRightFront
            self.orientation = .correct
        case (.front, .right, .down), (.right, .front, .down):
            self.solvedPosition = .downRightFront
            self.orientation = .clockwise
        case (.right, .down, .front), (.front, .down, .right):
            self.solvedPosition = .downRightFront
            self.orientation = .counterclockwise
        case (.down, .back, .right), (.down, .right, .back):
            self.solvedPosition = .downRightBack
            self.orientation = .correct
        case (.back, .right, .down), (.right, .back, .down):
            self.solvedPosition = .downRightBack
            self.orientation = .counterclockwise
        case (.right, .down, .back), (.back, .down, .right):
            self.solvedPosition = .downRightBack
            self.orientation = .clockwise
        case (.down, .front, .left), (.down, .left, .front):
            self.solvedPosition = .downLeftFront
            self.orientation = .correct
        case (.front, .left, .down), (.left, .front, .down):
            self.solvedPosition = .downLeftFront
            self.orientation = .counterclockwise
        case (.left, .down, .front), (.front, .down, .left):
            self.solvedPosition = .downLeftFront
            self.orientation = .clockwise
        case (.down, .back, .left), (.down, .left, .back):
            self.solvedPosition = .downLeftBack
            self.orientation = .correct
        case (.back, .left, .down), (.left, .back, .down):
            self.solvedPosition = .downLeftBack
            self.orientation = .clockwise
        case (.left, .down, .back), (.back, .down, .left):
            self.solvedPosition = .downLeftBack
            self.orientation = .counterclockwise
        default: return nil
        }
    }
}
