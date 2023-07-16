/// The 3x3 Rubik's cube twisty puzzle.
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
    /// The edges of a cube.
    ///
    /// The indices of the edges array correspond to fixed positions on a cube. For example, the edge at
    /// index 0 is the cubelet in the UR position and the edge at index 11 is the cubelet in the LB position. In
    /// a solved cube, the edges array is sorted (and all edge orientations are correct).
    ///
    /// - Important: The array must contain 12 edges with unique `solvedPosition` values to be
    /// valid.
    public var edges: [Edge]

    /// The corners of a cube.
    ///
    /// The indices of the corners array correspond to fixed positions on a cube. For example, the corner
    /// at index 0 is the cubelet in the URF position and the edge at index 7 is the cubelet in the DLB
    /// position. In a solved cube, the corners array is sorted (and all corner orientations are correct).
    ///
    /// - Important: The array must contain 8 corners with unique `solvedPosition` values to be
    /// valid.
    public var corners: [Corner]

    /// Initialize a cube from edge and corner cubelets.
    ///
    /// - Parameters:
    ///     - edges: The edges from which the cube will be initialized.
    ///     - corners: The corners from which the cube will be initialized.
    ///
    /// - Returns: A cube with the given edges and corners.
    ///
    /// The indices of the edges and corners array correspond to fixed positions on a cube. The mapping
    /// of index to cube position is provided in the following table:
    ///
    /// Index | Edge Position | Corner Position
    /// --- | --- | ---
    /// 0 | UR | URF
    /// 1 | UL | ULB
    /// 2 | DR | DRB
    /// 3 | DL | DLF
    /// 4 | UF | URB
    /// 5 | UB | ULF
    /// 6 | DF | DRF
    /// 7 | DB | DLB
    /// 8 | RF | -
    /// 9 | RB | -
    /// 10 | LF | -
    /// 11 | LB | -
    ///
    /// - Note: This may initialize an invalid cube. For example, if 2 empty arrays are passed as
    /// arguments, a cube will be initialized, but it will not be valid. If the cube's validity is not guaranteed or
    /// known, use ``isValid`` to check.
    public init(edges: [Edge], corners: [Corner]) {
        self.edges = edges
        self.corners = corners
    }
}
