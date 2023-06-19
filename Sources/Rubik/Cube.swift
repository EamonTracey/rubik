public struct Cube {
    public var edges: [Edge]
    public var corners: [Corner]
}

public extension Cube {
    static let solvedEdges: [Edge] = Cube.Edge.Position.allCases.map { position in
        Edge(orientation: .correct, solvedPosition: position)
    }
    
    static let solvedCorners: [Corner] = Cube.Corner.Position.allCases.map { position in
        Corner(orientation: .correct, solvedPosition: position)
    }
    
    static let solvedCube: Cube = Cube(edges: Cube.solvedEdges, corners: Cube.solvedCorners)
}

public extension Cube {
    @inlinable
    mutating func turn(_ turn: Turn) {
        switch turn {
        case .up(let degree):
            self.turnUp(degree)
        case .down(let degree):
            self.turnDown(degree)
        case .right(let degree):
            self.turnRight(degree)
        case .left(let degree):
            self.turnLeft(degree)
        case .front(let degree):
            self.turnFront(degree)
        case .back(let degree):
            self.turnBack(degree)
        }
    }
    
    @inlinable
    mutating func turnUp(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpRight = self.edges[.upRight]
            self.edges[.upRight] = self.edges[.upBack]
            self.edges[.upBack] = self.edges[.upLeft]
            self.edges[.upLeft] = self.edges[.upFront]
            self.edges[.upFront] = storedUpRight
            
            // Corner permutation.
            let storedUpRightFront = self.corners[.upRightFront]
            self.corners[.upRightFront] = self.corners[.upRightBack]
            self.corners[.upRightBack] = self.corners[.upLeftBack]
            self.corners[.upLeftBack] = self.corners[.upLeftFront]
            self.corners[.upLeftFront] = storedUpRightFront
        }
    }
    
    @inlinable
    mutating func turnDown(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedDownRight = self.edges[.downRight]
            self.edges[.downRight] = self.edges[.downFront]
            self.edges[.downFront] = self.edges[.downLeft]
            self.edges[.downLeft] = self.edges[.downBack]
            self.edges[.downBack] = storedDownRight
            
            // Corner permutation.
            let storedDownRightFront = self.corners[.downRightFront]
            self.corners[.downRightFront] = self.corners[.downLeftFront]
            self.corners[.downLeftFront] = self.corners[.downLeftBack]
            self.corners[.downLeftBack] = self.corners[.downRightBack]
            self.corners[.downRightBack] = storedDownRightFront
        }
    }
    
    @inlinable
    mutating func turnRight(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpRight = self.edges[.upRight]
            self.edges[.upRight] = self.edges[.rightFront]
            self.edges[.rightFront] = self.edges[.downRight]
            self.edges[.downRight] = self.edges[.rightBack]
            self.edges[.rightBack] = storedUpRight
            
            // Corner permutation.
            let storedUpRightFront = self.corners[.upRightFront]
            self.corners[.upRightFront] = self.corners[.downRightFront]
            self.corners[.downRightFront] = self.corners[.downRightBack]
            self.corners[.downRightBack] = self.corners[.upRightBack]
            self.corners[.upRightBack] = storedUpRightFront
            
            // Corner orientation.
            self.corners[.upRightFront].twist(.counterclockwise)
            self.corners[.upRightBack].twist(.clockwise)
            self.corners[.downRightFront].twist(.clockwise)
            self.corners[.downRightBack].twist(.counterclockwise)
        }
    }
    
    @inlinable
    mutating func turnLeft(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpLeft = self.edges[.upLeft]
            self.edges[.upLeft] = self.edges[.leftBack]
            self.edges[.leftBack] = self.edges[.downLeft]
            self.edges[.downLeft] = self.edges[.leftFront]
            self.edges[.leftFront] = storedUpLeft
            
            // Corner permutation.
            let storedUpLeftFront = self.corners[.upLeftFront]
            self.corners[.upLeftFront] = self.corners[.upLeftBack]
            self.corners[.upLeftBack] = self.corners[.downLeftBack]
            self.corners[.downLeftBack] = self.corners[.downLeftFront]
            self.corners[.downLeftFront] = storedUpLeftFront
            
            // Corner orientation.
            self.corners[.upLeftFront].twist(.clockwise)
            self.corners[.upLeftBack].twist(.counterclockwise)
            self.corners[.downLeftFront].twist(.counterclockwise)
            self.corners[.downLeftBack].twist(.clockwise)
        }
    }
    
    @inlinable
    mutating func turnFront(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpFront = self.edges[.upFront]
            self.edges[.upFront] = self.edges[.leftFront]
            self.edges[.leftFront] = self.edges[.downFront]
            self.edges[.downFront] = self.edges[.rightFront]
            self.edges[.rightFront] = storedUpFront
            
            // Corner permutation.
            let storedUpRightFront = self.corners[.upRightFront]
            self.corners[.upRightFront] = self.corners[.upLeftFront]
            self.corners[.upLeftFront] = self.corners[.downLeftFront]
            self.corners[.downLeftFront] = self.corners[.downRightFront]
            self.corners[.downRightFront] = storedUpRightFront
            
            // Edge orientation.
            self.edges[.upFront].flip()
            self.edges[.downFront].flip()
            self.edges[.rightFront].flip()
            self.edges[.leftFront].flip()
            
            // Corner orientation.
            self.corners[.upRightFront].twist(.clockwise)
            self.corners[.upLeftFront].twist(.counterclockwise)
            self.corners[.downRightFront].twist(.counterclockwise)
            self.corners[.downLeftFront].twist(.clockwise)
        }
    }
    
    @inlinable
    mutating func turnBack(_ degree: Turn.Degree) {
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedUpBack = self.edges[.upBack]
            self.edges[.upBack] = self.edges[.rightBack]
            self.edges[.rightBack] = self.edges[.downBack]
            self.edges[.downBack] = self.edges[.leftBack]
            self.edges[.leftBack] = storedUpBack
            
            // Corner permutation.
            let storedUpRightBack = self.corners[.upRightBack]
            self.corners[.upRightBack] = self.corners[.downRightBack]
            self.corners[.downRightBack] = self.corners[.downLeftBack]
            self.corners[.downLeftBack] = self.corners[.upLeftBack]
            self.corners[.upLeftBack] = storedUpRightBack
            
            // Edge orientation.
            self.edges[.upBack].flip()
            self.edges[.downBack].flip()
            self.edges[.rightBack].flip()
            self.edges[.leftBack].flip()
            
            // Corner orientation.
            self.corners[.upRightBack].twist(.counterclockwise)
            self.corners[.upLeftBack].twist(.clockwise)
            self.corners[.downRightBack].twist(.clockwise)
            self.corners[.downLeftBack].twist(.counterclockwise)
        }
    }
}

public extension Cube {
    @inlinable
    mutating func execute(_ algorithm: Algorithm, repeats: Int = 1) {
        for _ in 0..<repeats {
            for turn in algorithm.turns {
                self.turn(turn)
            }
        }
    }
}