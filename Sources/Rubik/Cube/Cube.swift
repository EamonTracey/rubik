/// A representation of the 3x3 Rubik's cube twisty puzzle.
///
/// The state of a cube is defined by the orientation and permutation of its 12 edges and the orientation and
/// permutation of its 8 corners. In the ``edges`` and ``corners`` arrays, the index of each cubelet
/// corresponds to its position in the cube. Therefore, the order of the arrays defines the cube's permutation.
/// A cube with the correct permutation will have the ``edges`` and ``corners`` arrays sorted
/// ascendingly by each cubelet's `solvedPosition` (each index matches the corresponding
/// `solvedPosition.rawValue`).
///
/// A convenient way to initialize a cube with a specific state is to scramble the ``solvedCube`` with an
/// ``Algorithm``. For example:
///
/// ```swift
/// var cube: Cube = .solvedCube
/// cube.execute(Algorithm("R U R' U' R' F R2 U' R' U' R U R' F'")!)
/// ```
///
/// - Important: A cube is valid if and only if the ``edges`` and ``corners`` arrays contain 12 and
/// 8 cubelets, respectively, with unique `solvedPosition` values. Otherwise, the cube is invalid, and
/// operations on the cube are undefined. Observe that a cube can be valid yet unsolvable.
public struct Cube {
    /// The edges of a 3x3 Rubik's cube.
    ///
    /// - Important: The array must contain 12 edges with unique `solvedPosition` values to be
    /// valid.
    public var edges: [Edge]
    
    /// The corners of a 3x3 Rubik's cube.
    ///
    /// - Important: The array must contain 8 corners with unique `solvedPosition` values to be
    /// valid.
    public var corners: [Corner]
}
