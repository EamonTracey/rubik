extension Cube {
    mutating func turn(_ turn: Turn) {
        /*
         * Apply the specified turn to the cube.
         */
        
        switch turn {
        case .up(let degree):
            self.turnUp(degree)
        case .down(let degree):
            fallthrough
        case .right(let degree):
            fallthrough
        case .left(let degree):
            fallthrough
        case .front(let degree):
            fallthrough
        case .back(let degree):
            fallthrough
        default:
            break
        }
    }

    mutating func turnUp(_ degree: TurnDegree) {
        /*
         * Turn the up layer.
         */
        
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
}
