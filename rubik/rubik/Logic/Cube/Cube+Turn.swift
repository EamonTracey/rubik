extension Cube {
    mutating func turn(_ turn: Turn) {
        /*
         * Apply the specified turn to the cube.
         */
        
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
    
    mutating func turnDown(_ degree: TurnDegree) {
        /*
         * Turn the down layer.
         */
        
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
    
    mutating func turnRight(_ degree: TurnDegree) {
        /*
         * Turn the right layer.
         */
        
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            
            // Corner permutation.
            
            // Corner orientation.
        }
    }
    
    mutating func turnLeft(_ degree: TurnDegree) {
        /*
         * Turn the left layer.
         */
        
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            
            // Corner permutation.
            
            // Corner orientation.
        }
    }
    
    mutating func turnFront(_ degree: TurnDegree) {
        /*
         * Turn the front layer.
         */
        
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            
            // Corner permutation.
            
            // Edge orientation.
            
            // Corner orientation.
        }
    }
    
    mutating func turnBack(_ degree: TurnDegree) {
        /*
         * Turn the back layer.
         */
        
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            
            // Corner permutation.
            
            // Edge orientation.
            
            // Corner orientation.
        }
    }
}
