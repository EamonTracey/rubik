extension Cube {
    var areEdgesOrientable: Bool {
        /*
         * Edge orientation changes by 4 edges at a time. A quarter turn of the F or B
         * layer toggles the orientation of the 4 edges on the F or B layer, respectively.
         * Note that it is possible for exactly 2 edges to be flipped (consider flipping
         * 4 edges and then flipping 3 of the same 4 edges plus an unflipped edge). Therefore,
         * in order for edges to be orientable, there must be an even number of flipped edges.
         */
        
        return self.edges.map { $0.orientation.rawValue }.reduce(0, ^) == 0
    }
    
    var areCornersOrientable: Bool {
        /*
         * Corner orientation changes by 4 corners at a time. A quarter turn of the
         * R, L, F, or B layer twists 2 corners clockwise and 2 corners counterclockwise
         * on the R, L, F, or B layer, respectively. Note that it is possible for exactly
         * 2 corners to be flipped with the sum of their orientations equaling 3 (consider
         * twisting 2 corners clockwise and 2 corners counterclockwise and then twist the
         * first 2 corners counterclockwise, 1 of the other corners clockwise, and an
         * untwisted corner clockwise). Therefore, in order for corners to be orientable,
         * the sum of the orientations of corners must be divisible by 3.
         */
        
        return self.corners.map { $0.orientation.rawValue }.reduce(0, +) % 3 == 0
    }
    
    var isPermutable: Bool {
        /*
         * Each turn of the cube cycles 4 edges and cycles 4 corners. Using such 4-cycles,
         * it is possible to construct 3-cycles of edges, 3-cycles of corners, swapping 2
         * edges and 2 corners, and much more. However, it is not possible to swap 2 edges
         * nor is it possible to swap 2 corners.
         *
         * The problem of permutability boils down to solving for the permutation parity of
         * both the edges and the corners and then comparing the parities. If they are equal,
         * the cube is permutable, otherwise it is not permutable. Since we store positions
         * as unique values that map to the indices of an array, we can define a permutation
         * function, σ, as the mapping of indices to values of our position array, P. Thus,
         * σ(x) = P[x]. Then, the permutation parity equals the number of inversions for σ.
         * The number of inversions equals the number of (a, b) pairs such that a < b and
         * σ(a) > σ(b).
         *
         * The naive implementation below is O(n^2) where n is the number of elements in the
         * array. However, since we know n = 12 for edges and n = 8 for corners, the computations
         * are O(144) and O(64), meaning they are arguably O(1) :).
         */
        
        var edgeInversions = 0
        var cornerInversions = 0
        
        
        // Compute edge permutation inversions.
        for a in self.edges.indices {
            for b in self.edges.indices {
                if a < b && self.edges[a].solvedPosition > self.edges[b].solvedPosition {
                    edgeInversions += 1
                }
            }
        }
        
        // Compute corner permutation inversions.
        for a in self.corners.indices {
            for b in self.corners.indices {
                if a < b && self.corners[a].solvedPosition > self.corners[b].solvedPosition {
                    cornerInversions += 1
                }
            }
        }
        
        // Return equality of parities of edge and corner inversions.
        return (edgeInversions ^ cornerInversions) & 1 == 0
    }
    
    var isSolvable: Bool {
        /*
         * A cube is solvable if and only if its edges are orientable, its corners
         * are orientable, and it is permutable.
         */
        
        return self.areEdgesOrientable && self.areCornersOrientable && self.isPermutable
    }
}
