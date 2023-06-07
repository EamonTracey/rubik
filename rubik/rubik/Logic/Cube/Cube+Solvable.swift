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
    
    // TODO: Implement
    var isPermutable: Bool {
        return true
    }
    
    var isSolvable: Bool {
        return self.areEdgesOrientable && self.areCornersOrientable && self.isPermutable
    }
}
