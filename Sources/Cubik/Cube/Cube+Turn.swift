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
        case .up(.clockwise):           turnUpClockwise()
        case .up(.half):                turnUpHalf()
        case .up(.counterclockwise):    turnUpCounterclockwise()
        case .down(.clockwise):         turnDownClockwise()
        case .down(.half):              turnDownHalf()
        case .down(.counterclockwise):  turnDownCounterclockwise()
        case .right(.clockwise):        turnRightClockwise()
        case .right(.half):             turnRightHalf()
        case .right(.counterclockwise): turnRightCounterclockwise()
        case .left(.clockwise):         turnLeftClockwise()
        case .left(.half):              turnLeftHalf()
        case .left(.counterclockwise):  turnLeftCounterclockwise()
        case .front(.clockwise):        turnFrontClockwise()
        case .front(.half):             turnFrontHalf()
        case .front(.counterclockwise): turnFrontCounterclockwise()
        case .back(.clockwise):         turnBackClockwise()
        case .back(.half):              turnBackHalf()
        case .back(.counterclockwise):  turnBackCounterclockwise()
        case .standing(let degree):     turnStanding(degree)
        case .middle(let degree):       turnMiddle(degree)
        case .equator(let degree):      turnEquator(degree)
        case .upWide(let degree):       turnUpWide(degree)
        case .downWide(let degree):     turnDownWide(degree)
        case .rightWide(let degree):    turnRightWide(degree)
        case .leftWide(let degree):     turnLeftWide(degree)
        case .frontWide(let degree):    turnFrontWide(degree)
        case .backWide(let degree):     turnBackWide(degree)
        case .yAxis(let degree):        turnYAxis(degree)
        case .xAxis(let degree):        turnXAxis(degree)
        case .zAxis(let degree):        turnZAxis(degree)
        }
    }
}

extension Cube {
    @usableFromInline
    mutating func turnUpClockwise() {
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

    @usableFromInline
    mutating func turnUpHalf() {
        // Edge permutation.
        let storedUpRight = edges[.upRight]
        let storedUpFront = edges[.upFront]
        edges[.upRight] = edges[.upLeft]
        edges[.upLeft] = storedUpRight
        edges[.upFront] = edges[.upBack]
        edges[.upBack] = storedUpFront

        // Corner permutation.
        let storedUpRightFront = corners[.upRightFront]
        let storedUpRightBack = corners[.upRightBack]
        corners[.upRightFront] = corners[.upLeftBack]
        corners[.upLeftBack] = storedUpRightFront
        corners[.upRightBack] = corners[.upLeftFront]
        corners[.upLeftFront] = storedUpRightBack
    }

    @usableFromInline
    mutating func turnUpCounterclockwise() {
        // Edge permutation.
        let storedUpRight = edges[.upRight]
        edges[.upRight] = edges[.upFront]
        edges[.upFront] = edges[.upLeft]
        edges[.upLeft] = edges[.upBack]
        edges[.upBack] = storedUpRight

        // Corner permutation.
        let storedUpRightFront = corners[.upRightFront]
        corners[.upRightFront] = corners[.upLeftFront]
        corners[.upLeftFront] = corners[.upLeftBack]
        corners[.upLeftBack] = corners[.upRightBack]
        corners[.upRightBack] = storedUpRightFront
    }

    @usableFromInline
    mutating func turnDownClockwise() {
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

    @usableFromInline
    mutating func turnDownHalf() {
        // Edge permutation.
        let storedDownRight = edges[.downRight]
        let storedDownFront = edges[.downFront]
        edges[.downRight] = edges[.downLeft]
        edges[.downLeft] = storedDownRight
        edges[.downFront] = edges[.downBack]
        edges[.downBack] = storedDownFront

        // Corner permutation.
        let storedDownRightFront = corners[.downRightFront]
        let storedDownRightBack = corners[.downRightBack]
        corners[.downRightFront] = corners[.downLeftBack]
        corners[.downLeftBack] = storedDownRightFront
        corners[.downRightBack] = corners[.downLeftFront]
        corners[.downLeftFront] = storedDownRightBack
    }

    @usableFromInline
    mutating func turnDownCounterclockwise() {
        // Edge permutation.
        let storedDownRight = edges[.downRight]
        edges[.downRight] = edges[.downBack]
        edges[.downBack] = edges[.downLeft]
        edges[.downLeft] = edges[.downFront]
        edges[.downFront] = storedDownRight

        // Corner permutation.
        let storedDownRightFront = corners[.downRightFront]
        corners[.downRightFront] = corners[.downRightBack]
        corners[.downRightBack] = corners[.downLeftBack]
        corners[.downLeftBack] = corners[.downLeftFront]
        corners[.downLeftFront] = storedDownRightFront
    }

    @usableFromInline
    mutating func turnRightClockwise() {
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

    @usableFromInline
    mutating func turnRightHalf() {
        // Edge permutation.
        let storedUpRight = edges[.upRight]
        let storedRightFront = edges[.rightFront]
        edges[.upRight] = edges[.downRight]
        edges[.downRight] = storedUpRight
        edges[.rightFront] = edges[.rightBack]
        edges[.rightBack] = storedRightFront

        // Corner permutation.
        let storedUpRightFront = corners[.upRightFront]
        let storedUpRightBack = corners[.upRightBack]
        corners[.upRightFront] = corners[.downRightBack]
        corners[.downRightBack] = storedUpRightFront
        corners[.upRightBack] = corners[.downRightFront]
        corners[.downRightFront] = storedUpRightBack
    }

    @usableFromInline
    mutating func turnRightCounterclockwise() {
        // Edge permutation.
        let storedUpRight = edges[.upRight]
        edges[.upRight] = edges[.rightBack]
        edges[.rightBack] = edges[.downRight]
        edges[.downRight] = edges[.rightFront]
        edges[.rightFront] = storedUpRight

        // Corner permutation.
        let storedUpRightFront = corners[.upRightFront]
        corners[.upRightFront] = corners[.upRightBack]
        corners[.upRightBack] = corners[.downRightBack]
        corners[.downRightBack] = corners[.downRightFront]
        corners[.downRightFront] = storedUpRightFront

        // Corner orientation.
        corners[.upRightFront].twist(.counterclockwise)
        corners[.upRightBack].twist(.clockwise)
        corners[.downRightFront].twist(.clockwise)
        corners[.downRightBack].twist(.counterclockwise)
    }

    @usableFromInline
    mutating func turnLeftClockwise() {
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

    @usableFromInline
    mutating func turnLeftHalf() {
        // Edge permutation.
        let storedUpLeft = edges[.upLeft]
        let storedLeftFront = edges[.leftFront]
        edges[.upLeft] = edges[.downLeft]
        edges[.downLeft] = storedUpLeft
        edges[.leftFront] = edges[.leftBack]
        edges[.leftBack] = storedLeftFront

        // Corner permutation.
        let storedUpLeftFront = corners[.upLeftFront]
        let storedUpLeftBack = corners[.upLeftBack]
        corners[.upLeftFront] = corners[.downLeftBack]
        corners[.downLeftBack] = storedUpLeftFront
        corners[.upLeftBack] = corners[.downLeftFront]
        corners[.downLeftFront] = storedUpLeftBack
    }

    @usableFromInline
    mutating func turnLeftCounterclockwise() {
        // Edge permutation.
        let storedUpLeft = edges[.upLeft]
        edges[.upLeft] = edges[.leftFront]
        edges[.leftFront] = edges[.downLeft]
        edges[.downLeft] = edges[.leftBack]
        edges[.leftBack] = storedUpLeft

        // Corner permutation.
        let storedUpLeftFront = corners[.upLeftFront]
        corners[.upLeftFront] = corners[.downLeftFront]
        corners[.downLeftFront] = corners[.downLeftBack]
        corners[.downLeftBack] = corners[.upLeftBack]
        corners[.upLeftBack] = storedUpLeftFront

        // Corner orientation.
        corners[.upLeftFront].twist(.clockwise)
        corners[.upLeftBack].twist(.counterclockwise)
        corners[.downLeftFront].twist(.counterclockwise)
        corners[.downLeftBack].twist(.clockwise)
    }

    @usableFromInline
    mutating func turnFrontClockwise() {
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

    @usableFromInline
    mutating func turnFrontHalf() {
        // Edge permutation.
        let storedUpFront = edges[.upFront]
        let storedRightFront = edges[.rightFront]
        edges[.upFront] = edges[.downFront]
        edges[.downFront] = storedUpFront
        edges[.rightFront] = edges[.leftFront]
        edges[.leftFront] = storedRightFront

        // Corner permutation.
        let storedUpRightFront = corners[.upRightFront]
        let storedUpLeftFront = corners[.upLeftFront]
        corners[.upRightFront] = corners[.downLeftFront]
        corners[.downLeftFront] = storedUpRightFront
        corners[.upLeftFront] = corners[.downRightFront]
        corners[.downRightFront] = storedUpLeftFront
    }

    @usableFromInline
    mutating func turnFrontCounterclockwise() {
        // Edge permutation.
        let storedUpFront = edges[.upFront]
        edges[.upFront] = edges[.rightFront]
        edges[.rightFront] = edges[.downFront]
        edges[.downFront] = edges[.leftFront]
        edges[.leftFront] = storedUpFront

        // Corner permutation.
        let storedUpRightFront = corners[.upRightFront]
        corners[.upRightFront] = corners[.downRightFront]
        corners[.downRightFront] = corners[.downLeftFront]
        corners[.downLeftFront] = corners[.upLeftFront]
        corners[.upLeftFront] = storedUpRightFront

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

    @usableFromInline
    mutating func turnBackClockwise() {
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

    @usableFromInline
    mutating func turnBackHalf() {
        // Edge permutation.
        let storedUpBack = edges[.upBack]
        let storedRightBack = edges[.rightBack]
        edges[.upBack] = edges[.downBack]
        edges[.downBack] = storedUpBack
        edges[.rightBack] = edges[.leftBack]
        edges[.leftBack] = storedRightBack

        // Corner permutation.
        let storedUpRightBack = corners[.upRightBack]
        let storedUpLeftBack = corners[.upLeftBack]
        corners[.upRightBack] = corners[.downLeftBack]
        corners[.downLeftBack] = storedUpRightBack
        corners[.upLeftBack] = corners[.downRightBack]
        corners[.downRightBack] = storedUpLeftBack
    }

    @usableFromInline
    mutating func turnBackCounterclockwise() {
        // Edge permutation.
        let storedUpBack = edges[.upBack]
        edges[.upBack] = edges[.leftBack]
        edges[.leftBack] = edges[.downBack]
        edges[.downBack] = edges[.rightBack]
        edges[.rightBack] = storedUpBack

        // Corner permutation.
        let storedUpRightBack = corners[.upRightBack]
        corners[.upRightBack] = corners[.upLeftBack]
        corners[.upLeftBack] = corners[.downLeftBack]
        corners[.downLeftBack] = corners[.downRightBack]
        corners[.downRightBack] = storedUpRightBack

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

    @usableFromInline
    mutating func turnUpWide(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnUpClockwise()
            turnEquator(.counterclockwise)
        }
    }

    @usableFromInline
    mutating func turnDownWide(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnDownClockwise()
            turnEquator(.clockwise)
        }
    }

    @usableFromInline
    mutating func turnRightWide(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnRightClockwise()
            turnMiddle(.counterclockwise)
        }
    }

    @usableFromInline
    mutating func turnLeftWide(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnLeftClockwise()
            turnMiddle(.clockwise)
        }
    }

    @usableFromInline
    mutating func turnFrontWide(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnFrontClockwise()
            turnStanding(.clockwise)
        }
    }

    @usableFromInline
    mutating func turnBackWide(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnBackClockwise()
            turnStanding(.counterclockwise)
        }
    }

    @usableFromInline
    mutating func turnYAxis(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnUpClockwise()
            turnDownCounterclockwise()
            turnEquator(.counterclockwise)
        }
    }

    @usableFromInline
    mutating func turnXAxis(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnRightClockwise()
            turnLeftCounterclockwise()
            turnMiddle(.counterclockwise)
        }
    }

    @usableFromInline
    mutating func turnZAxis(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            turnFrontClockwise()
            turnBackCounterclockwise()
            turnStanding(.clockwise)
        }
    }
}
