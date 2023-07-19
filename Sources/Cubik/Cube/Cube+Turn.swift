extension Cube {
    /// Apply a turn to a cube.
    ///
    /// - Parameters:
    ///     - turn: The turn to be applied.
    ///
    /// The cube has 6 layers: up (U), down (D), right (R), left (L), front (F), and back (B). Each layer can be
    /// turned clockwise, counterclockwise, and halfway (in which case the direction is irrelevant). For
    /// example, perform the sexy move:
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    /// cube.turn(.right(.clockwise))
    /// cube.turn(.up(.clockwise))
    /// cube.turn(.right(.counterclockwise))
    /// cube.turn(.up(.counterclockwise))
    /// ```
    ///
    /// Each turns changes the permutation of the cube. The edges and corners of the layer are both
    /// 4-cycled. Further, depending on the turn, the orientation of edges and corners may change. Edge
    /// orientation changes by turns of the F and B layers. Corner orientation changes by turns of the R, L,
    /// F, and B layers.
    ///
    /// - Note: More information about how cubelet orientation is defined may be found in the
    /// documentation of ``Edge`` and ``Corner``.
    @inlinable
    public mutating func turn(_ turn: Turn) {
        switch turn {
        case .up(let degree):       turnUp(degree)
        case .down(let degree):     turnDown(degree)
        case .right(let degree):    turnRight(degree)
        case .left(let degree):     turnLeft(degree)
        case .front(let degree):    turnFront(degree)
        case .back(let degree):     turnBack(degree)
        case .standing(let degree): turnStanding(degree)
        case .middle(let degree):   turnMiddle(degree)
        case .equator(let degree):  turnEquator(degree)
        }
    }
}

extension Cube {
    @usableFromInline
    mutating func turnUp(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpRight = edges[.upRight]
            edges[.upRight] = edges[.upBack]
            edges[.upBack] = edges[.upLeft]
            edges[.upLeft] = edges[.upFront]
            edges[.upFront] = storedUpRight

            // Corner permutation.
            let storedUpRightFront = corners[.upRightFront]
            corners[.upRightFront] = corners[.upRightBack]
            corners[.upRightBack] = corners[.upLeftBack]
            corners[.upLeftBack] = corners[.upLeftFront]
            corners[.upLeftFront] = storedUpRightFront
        }
    }

    @usableFromInline
    mutating func turnDown(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedDownRight = edges[.downRight]
            edges[.downRight] = edges[.downFront]
            edges[.downFront] = edges[.downLeft]
            edges[.downLeft] = edges[.downBack]
            edges[.downBack] = storedDownRight

            // Corner permutation.
            let storedDownRightFront = corners[.downRightFront]
            corners[.downRightFront] = corners[.downLeftFront]
            corners[.downLeftFront] = corners[.downLeftBack]
            corners[.downLeftBack] = corners[.downRightBack]
            corners[.downRightBack] = storedDownRightFront
        }
    }

    @usableFromInline
    mutating func turnRight(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpRight = edges[.upRight]
            edges[.upRight] = edges[.rightFront]
            edges[.rightFront] = edges[.downRight]
            edges[.downRight] = edges[.rightBack]
            edges[.rightBack] = storedUpRight

            // Corner permutation.
            let storedUpRightFront = corners[.upRightFront]
            corners[.upRightFront] = corners[.downRightFront]
            corners[.downRightFront] = corners[.downRightBack]
            corners[.downRightBack] = corners[.upRightBack]
            corners[.upRightBack] = storedUpRightFront

            // Corner orientation.
            corners[.upRightFront].twist(.counterclockwise)
            corners[.upRightBack].twist(.clockwise)
            corners[.downRightFront].twist(.clockwise)
            corners[.downRightBack].twist(.counterclockwise)
        }
    }

    @usableFromInline
    mutating func turnLeft(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpLeft = edges[.upLeft]
            edges[.upLeft] = edges[.leftBack]
            edges[.leftBack] = edges[.downLeft]
            edges[.downLeft] = edges[.leftFront]
            edges[.leftFront] = storedUpLeft

            // Corner permutation.
            let storedUpLeftFront = corners[.upLeftFront]
            corners[.upLeftFront] = corners[.upLeftBack]
            corners[.upLeftBack] = corners[.downLeftBack]
            corners[.downLeftBack] = corners[.downLeftFront]
            corners[.downLeftFront] = storedUpLeftFront

            // Corner orientation.
            corners[.upLeftFront].twist(.clockwise)
            corners[.upLeftBack].twist(.counterclockwise)
            corners[.downLeftFront].twist(.counterclockwise)
            corners[.downLeftBack].twist(.clockwise)
        }
    }

    @usableFromInline
    mutating func turnFront(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpFront = edges[.upFront]
            edges[.upFront] = edges[.leftFront]
            edges[.leftFront] = edges[.downFront]
            edges[.downFront] = edges[.rightFront]
            edges[.rightFront] = storedUpFront

            // Corner permutation.
            let storedUpRightFront = corners[.upRightFront]
            corners[.upRightFront] = corners[.upLeftFront]
            corners[.upLeftFront] = corners[.downLeftFront]
            corners[.downLeftFront] = corners[.downRightFront]
            corners[.downRightFront] = storedUpRightFront

            // Edge orientation.
            edges[.upFront].flip()
            edges[.downFront].flip()
            edges[.rightFront].flip()
            edges[.leftFront].flip()

            // Corner orientation.
            corners[.upRightFront].twist(.clockwise)
            corners[.upLeftFront].twist(.counterclockwise)
            corners[.downRightFront].twist(.counterclockwise)
            corners[.downLeftFront].twist(.clockwise)
        }
    }

    @usableFromInline
    mutating func turnBack(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpBack = edges[.upBack]
            edges[.upBack] = edges[.rightBack]
            edges[.rightBack] = edges[.downBack]
            edges[.downBack] = edges[.leftBack]
            edges[.leftBack] = storedUpBack

            // Corner permutation.
            let storedUpRightBack = corners[.upRightBack]
            corners[.upRightBack] = corners[.downRightBack]
            corners[.downRightBack] = corners[.downLeftBack]
            corners[.downLeftBack] = corners[.upLeftBack]
            corners[.upLeftBack] = storedUpRightBack

            // Edge orientation.
            edges[.upBack].flip()
            edges[.downBack].flip()
            edges[.rightBack].flip()
            edges[.leftBack].flip()

            // Corner orientation.
            corners[.upRightBack].twist(.counterclockwise)
            corners[.upLeftBack].twist(.clockwise)
            corners[.downRightBack].twist(.clockwise)
            corners[.downLeftBack].twist(.counterclockwise)
        }
    }

    @usableFromInline
    mutating func turnStanding(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            var facelets = self.facelets

            let storedUpRightUp = facelets[5]
            facelets[5] = facelets[28]
            facelets[28] = facelets[12]
            facelets[12] = facelets[25]
            facelets[25] = storedUpRightUp

            let storedUpRightRight = facelets[19]
            facelets[19] = facelets[3]
            facelets[3] = facelets[34]
            facelets[34] = facelets[14]
            facelets[14] = storedUpRightRight

            let storedUpCenter = facelets[4]
            facelets[4] = facelets[31]
            facelets[31] = facelets[13]
            facelets[13] = facelets[22]
            facelets[22] = storedUpCenter

            self = Cube(facelets: facelets)!
        }
    }

    @usableFromInline
    mutating func turnMiddle(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            var facelets = self.facelets

            let storedUpFrontUp = facelets[7]
            facelets[7] = facelets[46]
            facelets[46] = facelets[16]
            facelets[16] = facelets[43]
            facelets[43] = storedUpFrontUp

            let storedUpFrontFront = facelets[37]
            facelets[37] = facelets[1]
            facelets[1] = facelets[52]
            facelets[52] = facelets[10]
            facelets[10] = storedUpFrontFront

            let storedUpCenter = facelets[4]
            facelets[4] = facelets[49]
            facelets[49] = facelets[13]
            facelets[13] = facelets[40]
            facelets[40] = storedUpCenter

            self = Cube(facelets: facelets)!
        }
    }

    @usableFromInline
    mutating func turnEquator(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            var facelets = self.facelets

            let storedRightFrontRight = facelets[21]
            facelets[21] = facelets[39]
            facelets[39] = facelets[30]
            facelets[30] = facelets[48]
            facelets[48] = storedRightFrontRight

            let storedRightFrontFront = facelets[41]
            facelets[41] = facelets[32]
            facelets[32] = facelets[50]
            facelets[50] = facelets[23]
            facelets[23] = storedRightFrontFront

            let storedRightCenter = facelets[22]
            facelets[22] = facelets[40]
            facelets[40] = facelets[31]
            facelets[31] = facelets[49]
            facelets[49] = storedRightCenter

            self = Cube(facelets: facelets)!
        }
    }
}
