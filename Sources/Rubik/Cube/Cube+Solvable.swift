extension Cube {
    /// Determine if the cubelets are permutable.
    ///
    /// Each turn of the cube cycles 4 edges and cycles 4 corners. Using such 4-cycles, it is possible to
    /// construct 3-cycles of edges, 3-cycles of corners, swapping 2 edges and 2 corners, and much more.
    /// However, it is not possible to swap 2 edges nor is it possible to swap 2 corners.
    ///
    /// Applying any sequence of turns or algorithms to a cube will not change its permutability. To change
    /// permutability, perform an odd number of swaps of cubelets. With a physical cube, this is akin to
    /// removing two cubelets and returning them into each other's previous positions.
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    ///
    /// // cube.isPermutable == true
    /// assert(cube.isPermutable)
    ///
    /// // Swap 2 edges.
    /// cube.edges.swapAt(0, 1)
    ///
    /// // cube.isPermutable == false
    /// assert(!cube.isPermutable)
    /// ```
    public var isPermutable: Bool {
        var edgeInversions: Int = 0
        var cornerInversions: Int = 0
        
        for (a, elementA) in edges.enumerated() {
            for elementB in edges[(a + 1)...] {
                if elementA.solvedPosition.rawValue > elementB.solvedPosition.rawValue {
                    edgeInversions += 1
                }
            }
        }
        
        for (a, elementA) in corners.enumerated() {
            for elementB in corners[(a + 1)...] {
                if elementA.solvedPosition.rawValue > elementB.solvedPosition.rawValue {
                    cornerInversions += 1
                }
            }
        }
        
        return (edgeInversions ^ cornerInversions) & 1 == 0
    }
    
    /// Determine if the edges are orientable.
    ///
    /// Edge orientation changes by 4 edges at a time. A quarter turn of the F or B layer toggles the
    /// orientation of the 4 edges on the F or B layer, respectively. Note that it is possible for exactly 2
    /// edges to be flipped (i.e., flip 4 edges and then flip 3 of the same 4 edges plus an unflipped edge).
    /// Therefore, in order for edges to be orientable, there must be an even number of flipped edges.
    ///
    /// Applying any sequence of turns or algorithms to a cube will not change its edge orientability. To
    /// change edge orientability, flip the orientation of an odd number of edges. With a physical cube, this
    /// is akin to removing one edge and returning it with the flipped orientation.
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    ///
    /// // cube.areEdgesOrientable == true
    /// assert(cube.areEdgesOrientable)
    ///
    /// // Flip an edge.
    /// cube.edges[0].flip()
    ///
    /// // cube.areEdgesOrientable == false
    /// assert(!cube.areEdgesOrientable)
    /// ```
    public var areEdgesOrientable: Bool {
        return edges.map { $0.solvedPosition.rawValue }.reduce(0, ^) == 0
    }
    
    /// Determine if the corners are orientable.
    ///
    /// Corner orientation changes by 4 corners at a time. A quarter turn of the R, L, F, or B layer twists 2
    /// corners clockwise and 2 corners counterclockwise on the R, L, F, or B layer, respectively. Note that
    /// it is possible for exactly 2 corners to be flipped with the sum of their orientations equaling 3 (i.e.,
    /// twist 2 corners clockwise and 2 corners counterclockwise and then twist the first 2 corners
    /// counterclockwise, 1 of the other corners clockwise, and an untwisted corner clockwise). Therefore,
    /// in order for corners to be orientable, the sum of the orientations of corners must be divisible by 3.
    ///
    /// Applying any sequence of turns or algorithms to a cube will not change its corner orientability. To
    /// change corner orientability, twist corners such that the sum of their orientations is not divisible by 3.
    /// With a physical cube, this is akin to twisting one corner either clockwise or counterclockwise.
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    ///
    /// // cube.areCornersOrientable == true
    /// assert(cube.areCornersOrientable)
    ///
    /// // Twist a corner.
    /// cube.corners[0].twist(.clockwise)
    ///
    /// // cube.areCornersOrientable == false
    /// assert(!cube.areCornersOrientable)
    /// ```
    public var areCornersOrientable: Bool {
        return corners.map { $0.solvedPosition.rawValue }.reduce(0, +) % 3 == 0
    }
    
    /// Determine if a cube is solvable.
    ///
    /// A cube is solvable if and only if it is permutable, its edges are orientable, and its corners are
    /// orientable.
    public var isSolvable: Bool {
        return isPermutable && areEdgesOrientable && areCornersOrientable
    }
}
