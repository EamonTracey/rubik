extension Cube {
    /// A facelet of a cube.
    ///
    /// There are 54 facelets on a cube.
    ///
    /// The facelets of a cube are analagous to stickers. There are 6 types of facelets, and there are 9 of
    /// each type on a valid cube. While it is often more useful to view the cube as a collection of pieces
    /// rather than stickers, it is arguably easiest to use the stickers to communicate the state of a cube.
    public enum Facelet: String, CaseIterable {
        case up = "u"
        case down = "d"
        case right = "r"
        case left = "l"
        case front = "f"
        case back = "b"
    }
}

extension Cube {
    /// Initialize a cube from facelets.
    ///
    /// - Parameters:
    ///     - facelets: The array of facelets from which the cube will be initialized.
    ///
    /// - Returns: A cube if the facelets represent valid cubelets.
    ///
    /// The facelets array must have 54 facelets. Each index of the array corresponds to a fixed facelet on
    /// a cube. The numbering of facelets begins on the left back facelet of the up face. Numbering
    /// continues sequentially as if reading the face left-to-right and up-to-down. After the 9 facelets on the
    /// up face are the 9 facelets on the down face. Then, in order, are the right, left, front, and back faces.
    /// Numbering on each face always begins on the top left facelet of the face if the cube were to be
    /// rotated to have the face in front.
    ///
    /// Observe that, given the rules above, the facelets at the following indices correspond to the centers
    /// of the cube:
    ///
    /// Index | Center Face
    /// --- | ---
    /// 4 | up
    /// 13 | down
    /// 22 | right
    /// 31 | left
    /// 40 | front
    /// 49 | back
    ///
    /// - Note: This may initialize an invalid cube. Since cubes are internally stored as cubelets, the
    /// initializer must fail if the facelets correspond to invalid cubelets, such as an edge with an up facelet
    /// and a down facelet. However, if all 20 cubelets are valid, the initializer will succeed, no matter the
    /// validity of the cube. If the cube's validity is not guaranteed or known, use ``isValid`` to check.
    @inlinable
    public init?(facelets: [Facelet]) {
        guard facelets.count == 54 else { return nil }

        guard facelets[4] == .up else { return nil }
        guard facelets[13] == .down else { return nil }
        guard facelets[22] == .right else { return nil }
        guard facelets[31] == .left else { return nil }
        guard facelets[40] == .front else { return nil }
        guard facelets[49] == .back else { return nil }

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

    /// The facelets of a cube.
    ///
    /// - Precondition: The cube must be valid. If `cube.isValid` evaluates to `false`, the
    /// program will crash. If the cube's validity is not guaranteed or known, use ``isValid`` to check.
    @inlinable
    public var facelets: [Facelet] {
        precondition(isValid)

        var facelets = Array(repeating: Facelet.up, count: 54)

        facelets[4] = .up
        facelets[13] = .down
        facelets[22] = .right
        facelets[31] = .left
        facelets[40] = .front
        facelets[49] = .back

        (facelets[5], facelets[19]) = edges[0].getFacelets()
        (facelets[3], facelets[28]) = edges[1].getFacelets()
        (facelets[14], facelets[25]) = edges[2].getFacelets()
        (facelets[12], facelets[34]) = edges[3].getFacelets()
        (facelets[7], facelets[37]) = edges[4].getFacelets()
        (facelets[1], facelets[46]) = edges[5].getFacelets()
        (facelets[10], facelets[43]) = edges[6].getFacelets()
        (facelets[16], facelets[52]) = edges[7].getFacelets()
        (facelets[41], facelets[21]) = edges[8].getFacelets()
        (facelets[48], facelets[23]) = edges[9].getFacelets()
        (facelets[39], facelets[32]) = edges[10].getFacelets()
        (facelets[50], facelets[30]) = edges[11].getFacelets()

        (facelets[8], facelets[38], facelets[18]) = corners[0].getFacelets(tetrad: .first)
        (facelets[0], facelets[47], facelets[27]) = corners[1].getFacelets(tetrad: .first)
        (facelets[17], facelets[51], facelets[26]) = corners[2].getFacelets(tetrad: .first)
        (facelets[9], facelets[42], facelets[35]) = corners[3].getFacelets(tetrad: .first)
        (facelets[2], facelets[45], facelets[20]) = corners[4].getFacelets(tetrad: .second)
        (facelets[6], facelets[36], facelets[29]) = corners[5].getFacelets(tetrad: .second)
        (facelets[11], facelets[44], facelets[24]) = corners[6].getFacelets(tetrad: .second)
        (facelets[15], facelets[53], facelets[33]) = corners[7].getFacelets(tetrad: .second)

        return facelets
    }
}

extension Cube.Edge {
    @usableFromInline
    init?(_ faceletA: Cube.Facelet, _ faceletB: Cube.Facelet) {
        switch (faceletA, faceletB) {
        case (.up, .right):
            self.init(orientation: .correct, solvedPosition: .upRight)
        case (.right, .up):
            self.init(orientation: .flipped, solvedPosition: .upRight)
        case (.up, .left):
            self.init(orientation: .correct, solvedPosition: .upLeft)
        case (.left, .up):
            self.init(orientation: .flipped, solvedPosition: .upLeft)
        case (.down, .right):
            self.init(orientation: .correct, solvedPosition: .downRight)
        case (.right, .down):
            self.init(orientation: .flipped, solvedPosition: .downRight)
        case (.down, .left):
            self.init(orientation: .correct, solvedPosition: .downLeft)
        case (.left, .down):
            self.init(orientation: .flipped, solvedPosition: .downLeft)
        case (.up, .front):
            self.init(orientation: .correct, solvedPosition: .upFront)
        case (.front, .up):
            self.init(orientation: .flipped, solvedPosition: .upFront)
        case (.up, .back):
            self.init(orientation: .correct, solvedPosition: .upBack)
        case (.back, .up):
            self.init(orientation: .flipped, solvedPosition: .upBack)
        case (.down, .front):
            self.init(orientation: .correct, solvedPosition: .downFront)
        case (.front, .down):
            self.init(orientation: .flipped, solvedPosition: .downFront)
        case (.down, .back):
            self.init(orientation: .correct, solvedPosition: .downBack)
        case (.back, .down):
            self.init(orientation: .flipped, solvedPosition: .downBack)
        case (.front, .right):
            self.init(orientation: .correct, solvedPosition: .rightFront)
        case (.right, .front):
            self.init(orientation: .flipped, solvedPosition: .rightFront)
        case (.back, .right):
            self.init(orientation: .correct, solvedPosition: .rightBack)
        case (.right, .back):
            self.init(orientation: .flipped, solvedPosition: .rightBack)
        case (.front, .left):
            self.init(orientation: .correct, solvedPosition: .leftFront)
        case (.left, .front):
            self.init(orientation: .flipped, solvedPosition: .leftFront)
        case (.back, .left):
            self.init(orientation: .correct, solvedPosition: .leftBack)
        case (.left, .back):
            self.init(orientation: .flipped, solvedPosition: .leftBack)
        default: return nil
        }
    }

    @usableFromInline
    func getFacelets() -> (Cube.Facelet, Cube.Facelet) {
        switch (orientation, solvedPosition) {
        case (.correct, .upRight):
            return (.up, .right)
        case (.flipped, .upRight):
            return (.right, .up)
        case (.correct, .upLeft):
            return (.up, .left)
        case (.flipped, .upLeft):
            return (.left, .up)
        case (.correct, .downRight):
            return (.down, .right)
        case (.flipped, .downRight):
            return (.right, .down)
        case (.correct, .downLeft):
            return (.down, .left)
        case (.flipped, .downLeft):
            return (.left, .down)
        case (.correct, .upFront):
            return (.up, .front)
        case (.flipped, .upFront):
            return (.front, .up)
        case (.correct, .upBack):
            return (.up, .back)
        case (.flipped, .upBack):
            return (.back, .up)
        case (.correct, .downFront):
            return (.down, .front)
        case (.flipped, .downFront):
            return (.front, .down)
        case (.correct, .downBack):
            return (.down, .back)
        case (.flipped, .downBack):
            return (.back, .down)
        case (.correct, .rightFront):
            return (.front, .right)
        case (.flipped, .rightFront):
            return (.right, .front)
        case (.correct, .rightBack):
            return (.back, .right)
        case (.flipped, .rightBack):
            return (.right, .back)
        case (.correct, .leftFront):
            return (.front, .left)
        case (.flipped, .leftFront):
            return (.left, .front)
        case (.correct, .leftBack):
            return (.back, .left)
        case (.flipped, .leftBack):
            return (.left, .back)
        }
    }
}

extension Cube.Corner {
    @usableFromInline
    init?(_ faceletA: Cube.Facelet, _ faceletB: Cube.Facelet, _ faceletC: Cube.Facelet) {
        switch (faceletA, faceletB, faceletC) {
        case (.up, .right, .front), (.up, .front, .right):
            self.init(orientation: .correct, solvedPosition: .upRightFront)
        case (.front, .up, .right), (.front, .right, .up):
            self.init(orientation: .clockwise, solvedPosition: .upRightFront)
        case (.right, .up, .front), (.right, .front, .up):
            self.init(orientation: .counterclockwise, solvedPosition: .upRightFront)
        case (.up, .left, .back), (.up, .back, .left):
            self.init(orientation: .correct, solvedPosition: .upLeftBack)
        case (.back, .up, .left), (.back, .left, .up):
            self.init(orientation: .clockwise, solvedPosition: .upLeftBack)
        case (.left, .up, .back), (.left, .back, .up):
            self.init(orientation: .counterclockwise, solvedPosition: .upLeftBack)
        case (.down, .right, .back), (.down, .back, .right):
            self.init(orientation: .correct, solvedPosition: .downRightBack)
        case (.back, .down, .right), (.back, .right, .down):
            self.init(orientation: .clockwise, solvedPosition: .downRightBack)
        case (.right, .down, .back), (.right, .back, .down):
            self.init(orientation: .counterclockwise, solvedPosition: .downRightBack)
        case (.down, .left, .front), (.down, .front, .left):
            self.init(orientation: .correct, solvedPosition: .downLeftFront)
        case (.front, .down, .left), (.front, .left, .down):
            self.init(orientation: .clockwise, solvedPosition: .downLeftFront)
        case (.left, .down, .front), (.left, .front, .down):
            self.init(orientation: .counterclockwise, solvedPosition: .downLeftFront)
        case (.up, .right, .back), (.up, .back, .right):
            self.init(orientation: .correct, solvedPosition: .upRightBack)
        case (.right, .up, .back), (.right, .back, .up):
            self.init(orientation: .clockwise, solvedPosition: .upRightBack)
        case (.back, .up, .right), (.back, .right, .up):
            self.init(orientation: .counterclockwise, solvedPosition: .upRightBack)
        case (.up, .left, .front), (.up, .front, .left):
            self.init(orientation: .correct, solvedPosition: .upLeftFront)
        case (.left, .up, .front), (.left, .front, .up):
            self.init(orientation: .clockwise, solvedPosition: .upLeftFront)
        case (.front, .up, .left), (.front, .left, .up):
            self.init(orientation: .counterclockwise, solvedPosition: .upLeftFront)
        case (.down, .right, .front), (.down, .front, .right):
            self.init(orientation: .correct, solvedPosition: .downRightFront)
        case (.right, .down, .front), (.right, .front, .down):
            self.init(orientation: .clockwise, solvedPosition: .downRightFront)
        case (.front, .down, .right), (.front, .right, .down):
            self.init(orientation: .counterclockwise, solvedPosition: .downRightFront)
        case (.down, .left, .back), (.down, .back, .left):
            self.init(orientation: .correct, solvedPosition: .downLeftBack)
        case (.left, .down, .back), (.left, .back, .down):
            self.init(orientation: .clockwise, solvedPosition: .downLeftBack)
        case (.back, .down, .left), (.back, .left, .down):
            self.init(orientation: .counterclockwise, solvedPosition: .downLeftBack)
        default: return nil
        }
    }

    @usableFromInline
    func getFacelets(tetrad: Cube.Corner.Tetrad) -> (Cube.Facelet, Cube.Facelet, Cube.Facelet) {
        switch (orientation, solvedPosition, self.tetrad == tetrad) {
        case (.correct, .upRightFront, true):
            return (.up, .front, .right)
        case (.correct, .upRightFront, false):
            return (.up, .right, .front)
        case (.clockwise, .upRightFront, true):
            return (.front, .right, .up)
        case (.clockwise, .upRightFront, false):
            return (.front, .up, .right)
        case (.counterclockwise, .upRightFront, true):
            return (.right, .up, .front)
        case (.counterclockwise, .upRightFront, false):
            return (.right, .front, .up)
        case (.correct, .upLeftBack, true):
            return (.up, .back, .left)
        case (.correct, .upLeftBack, false):
            return (.up, .left, .back)
        case (.clockwise, .upLeftBack, true):
            return (.back, .left, .up)
        case (.clockwise, .upLeftBack, false):
            return (.back, .up, .left)
        case (.counterclockwise, .upLeftBack, true):
            return (.left, .up, .back)
        case (.counterclockwise, .upLeftBack, false):
            return (.left, .back, .up)
        case (.correct, .downRightBack, true):
            return (.down, .back, .right)
        case (.correct, .downRightBack, false):
            return (.down, .right, .back)
        case (.clockwise, .downRightBack, true):
            return (.back, .right, .down)
        case (.clockwise, .downRightBack, false):
            return (.back, .down, .right)
        case (.counterclockwise, .downRightBack, true):
            return (.right, .down, .back)
        case (.counterclockwise, .downRightBack, false):
            return (.right, .back, .down)
        case (.correct, .downLeftFront, true):
            return (.down, .front, .left)
        case (.correct, .downLeftFront, false):
            return (.down, .left, .front)
        case (.clockwise, .downLeftFront, true):
            return (.front, .left, .down)
        case (.clockwise, .downLeftFront, false):
            return (.front, .down, .left)
        case (.counterclockwise, .downLeftFront, true):
            return (.left, .down, .front)
        case (.counterclockwise, .downLeftFront, false):
            return (.left, .front, .down)
        case (.correct, .upRightBack, true):
            return (.up, .back, .right)
        case (.correct, .upRightBack, false):
            return (.up, .right, .back)
        case (.clockwise, .upRightBack, true):
            return (.right, .up, .back)
        case (.clockwise, .upRightBack, false):
            return (.right, .back, .up)
        case (.counterclockwise, .upRightBack, true):
            return (.back, .right, .up)
        case (.counterclockwise, .upRightBack, false):
            return (.back, .up, .right)
        case (.correct, .upLeftFront, true):
            return (.up, .front, .left)
        case (.correct, .upLeftFront, false):
            return (.up, .left, .front)
        case (.clockwise, .upLeftFront, true):
            return (.left, .up, .front)
        case (.clockwise, .upLeftFront, false):
            return (.left, .front, .up)
        case (.counterclockwise, .upLeftFront, true):
            return (.front, .left, .up)
        case (.counterclockwise, .upLeftFront, false):
            return (.front, .up, .left)
        case (.correct, .downRightFront, true):
            return (.down, .front, .right)
        case (.correct, .downRightFront, false):
            return (.down, .right, .front)
        case (.clockwise, .downRightFront, true):
            return (.right, .down, .front)
        case (.clockwise, .downRightFront, false):
            return (.right, .front, .down)
        case (.counterclockwise, .downRightFront, true):
            return (.front, .right, .down)
        case (.counterclockwise, .downRightFront, false):
            return (.front, .down, .right)
        case (.correct, .downLeftBack, true):
            return (.down, .back, .left)
        case (.correct, .downLeftBack, false):
            return (.down, .left, .back)
        case (.clockwise, .downLeftBack, true):
            return (.left, .down, .back)
        case (.clockwise, .downLeftBack, false):
            return (.left, .back, .down)
        case (.counterclockwise, .downLeftBack, true):
            return (.back, .left, .down)
        case (.counterclockwise, .downLeftBack, false):
            return (.back, .down, .left)
        }
    }
}
