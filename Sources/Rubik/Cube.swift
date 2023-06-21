/// A representation of the 3x3 Rubik's cube twisty puzzle.
///
/// The state of a cube is defined by the orientation and permutation of its 12 edges
/// and the orientation and permutation of its 8 corners. In the ``edges`` and ``corners``
/// arrays, the index of each cubelet corresponds to its position in the cube. Therefore, the order
/// of the arrays defines the cube's permutation. A cube with the correct permutation will have the
/// ``edges`` and ``corners`` arrays sorted ascendingly by each cubelet's `solvedPosition`
/// (each index matches the corresponding `solvedPosition.rawValue`).
///
/// A convenient way to initialize a cube with a specific state is to scramble the ``solvedCube``
/// with an ``Algorithm``. For example:
///
/// ```swift
/// var cube: Cube = .solvedCube
/// cube.execute(Algorithm("R U R' U' R' F R2 U' R' U' R U R' F'")!)
/// ```
///
/// - Important: A cube is valid if and only if the ``edges`` and ``corners`` arrays contain
/// 12 and 8 cubelets, respectively, with unique `solvedPosition` values. Otherwise, the cube is
/// invalid, and operations on the cube are undefined. Observe that a cube can be valid yet unsolvable.
public struct Cube {
    /// The edges of a 3x3 Rubik's cube.
    ///
    /// - Important: The array must contain 12 edges with unique `solvedPosition` values to be valid.
    public var edges: [Edge]
    
    /// The corners of a 3x3 Rubik's cube.
    ///
    /// - Important: The array must contain 8 corners with unique `solvedPosition` values to be valid.
    public var corners: [Corner]
}

public extension Cube {
    /// The array of edges that corresponds to a solved cube.
    ///
    /// The array is sorted ascendingly by the `solvedPosition` of each ``Edge``.
    static let solvedEdges: [Edge] = Cube.Edge.Position.allCases.map { position in
        Edge(orientation: .correct, solvedPosition: position)
    }
    
    /// The array of corners that corresponds to a solved cube.
    ///
    /// The array is sorted ascendingly by the `solvedPosition` of each ``Corner``.
    static let solvedCorners: [Corner] = Cube.Corner.Position.allCases.map { position in
        Corner(orientation: .correct, solvedPosition: position)
    }
    
    /// The cube in the solved state.
    static let solvedCube: Cube = Cube(edges: Cube.solvedEdges, corners: Cube.solvedCorners)
}

extension Cube {
    /// Apply a turn to a cube.
    ///
    /// For example, perform the sexy move:
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    /// cube.turn(.right(.clockwise))
    /// cube.turn(.up(.clockwise))
    /// cube.turn(.right(.counterclockwise))
    /// cube.turn(.up(.counterclockwise))
    /// ```
    ///
    /// The cube has 6 layers: up (U), down (D), right (R), left (L), front (F), and back (B). Each layer can be turned clockwise,
    /// counterclockwise, and halfway (in which case the direction is irrelevant).
    ///
    /// Each turns changes the permutation of the cube. The edges and corners of the layer are both 4-cycled. Further, depending
    /// on the turn, the orientation of edges and corners may change. Edge orientation changes by turns of the F and B layers.
    /// Corner orientation changes by turns of the R, L, F, and B layers.
    ///
    /// - Note: More information about how cubelet orientation is defined may be found in the documentation of ``Edge`` and ``Corner``.
    @inlinable
    public mutating func turn(_ turn: Turn) {
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
    internal mutating func turnUp(_ degree: Turn.Degree) {
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
    internal mutating func turnDown(_ degree: Turn.Degree) {
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
    internal mutating func turnRight(_ degree: Turn.Degree) {
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
    internal mutating func turnLeft(_ degree: Turn.Degree) {
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
    internal mutating func turnFront(_ degree: Turn.Degree) {
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
    internal mutating func turnBack(_ degree: Turn.Degree) {
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

extension Cube {
    @inlinable
    public mutating func execute(_ algorithm: Algorithm, repeats: Int = 1) {
        for _ in 0..<repeats {
            for turn in algorithm.turns {
                self.turn(turn)
            }
        }
    }
}
