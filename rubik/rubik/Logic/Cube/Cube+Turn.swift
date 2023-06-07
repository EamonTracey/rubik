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
            let storedRightFront = self.edges[.rightFront]
            self.edges[.rightFront] = self.edges[.downRight]
            self.edges[.downRight] = self.edges[.rightBack]
            self.edges[.rightBack] = self.edges[.upRight]
            self.edges[.upRight] = storedRightFront
            
            // Corner permutation.
            let storedUpRightFront = self.corners[.upRightFront]
            self.corners[.upRightFront] = self.corners[.downRightFront]
            self.corners[.downRightFront] = self.corners[.downRightBack]
            self.corners[.downRightBack] = self.corners[.upRightBack]
            self.corners[.upRightBack] = storedUpRightFront
            
            // Corner orientation.
            self.corners[.upRightFront].orientation = (self.corners[.upRightFront].orientation + 1) % 3
            self.corners[.downRightFront].orientation = (self.corners[.downRightFront].orientation + 1) % 3
            self.corners[.downRightBack].orientation = (self.corners[.downRightBack].orientation + 1) % 3
            self.corners[.upRightBack].orientation = (self.corners[.upRightBack].orientation + 1) % 3
        }
    }
    
    mutating func turnLeft(_ degree: TurnDegree) {
        /*
         * Turn the left layer.
         */
        
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedLeftFront = self.edges[.leftFront]
            self.edges[.leftFront] = self.edges[.downLeft]
            self.edges[.downLeft] = self.edges[.leftBack]
            self.edges[.leftBack] = self.edges[.upLeft]
            self.edges[.upLeft] = storedLeftFront
            
            // Corner permutation.
            let storedUpLeftFront = self.corners[.upLeftFront]
            self.corners[.upLeftFront] = self.corners[.downLeftFront]
            self.corners[.downLeftFront] = self.corners[.downLeftBack]
            self.corners[.downLeftBack] = self.corners[.upLeftBack]
            self.corners[.upLeftBack] = storedUpLeftFront
            
            // Corner orientation.
            self.corners[.upLeftFront].orientation = (self.corners[.upLeftFront].orientation + 1) % 3
            self.corners[.downLeftFront].orientation = (self.corners[.downLeftFront].orientation + 1) % 3
            self.corners[.downLeftBack].orientation = (self.corners[.downLeftBack].orientation + 1) % 3
            self.corners[.upLeftBack].orientation = (self.corners[.upLeftBack].orientation + 1) % 3
        }
    }
    
    mutating func turnFront(_ degree: TurnDegree) {
        /*
         * Turn the front layer.
         */
        
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedLeftFront = self.edges[.leftFront]
            self.edges[.leftFront] = self.edges[.downFront]
            self.edges[.downFront] = self.edges[.rightFront]
            self.edges[.rightFront] = self.edges[.upFront]
            self.edges[.upFront] = storedLeftFront
            
            // Corner permutation.
            let storedUpLeftFront = self.corners[.upLeftFront]
            self.corners[.upLeftFront] = self.corners[.downLeftFront]
            self.corners[.downLeftFront] = self.corners[.downRightBack]
            self.corners[.downRightBack] = self.corners[.upRightFront]
            self.corners[.upRightFront] = storedUpLeftFront
            
            // Edge orientation.
            self.corners[.upFront].orientation = 1 - self.corners[.upFront].orientation
            self.corners[.leftFront].orientation = 1 - self.corners[.leftFront].orientation
            self.corners[.rightFront].orientation = 1 - self.corners[.rightFront].orientation
            self.corners[.downFront].orientation = 1 - self.corners[.downFront].orientation
            
            // Corner orientation.
            self.corners[.upLeftFront].orientation = (self.corners[.upLeftFront].orientation + 1) % 3
            self.corners[.downLeftFront].orientation = (self.corners[.downLeftFront].orientation + 1) % 3
            self.corners[.downRightFront].orientation = (self.corners[.downRightFront].orientation + 1) % 3
            self.corners[.upRightFront].orientation = (self.corners[.upRightFront].orientation + 1) % 3
        }
    }
    
    mutating func turnBack(_ degree: TurnDegree) {
        /*
         * Turn the back layer.
         */
        
        for _ in 0..<degree.rawValue {
            // Edge permutation.
            let storedLeftBack = self.edges[.leftBack]
            self.edges[.leftBack] = self.edges[.upBack]
            self.edges[.upBack] = self.edges[.rightBack]
            self.edges[.rightBack] = self.edges[.downBack]
            self.edges[.downBack] = storedLeftBack
            
            // Corner permutation.
            let storedUpLeftBack = self.corners[.upLeftBack]
            self.corners[.upLeftBack] = self.corners[.upRightBack]
            self.corners[.upRightBack] = self.corners[.downRightBack]
            self.corners[.downRightBack] = self.corners[.downLeftBack]
            self.corners[.downLeftBack] = storedUpLeftBack
            
            // Edge orientation.
            self.corners[.upBack].orientation = 1 - self.corners[.upBack].orientation
            self.corners[.leftBack].orientation = 1 - self.corners[.leftBack].orientation
            self.corners[.rightBack].orientation = 1 - self.corners[.rightBack].orientation
            self.corners[.downBack].orientation = 1 - self.corners[.downBack].orientation
            
            // Corner orientation.
            self.corners[.upLeftBack].orientation = (self.corners[.upLeftBack].orientation + 1) % 3
            self.corners[.upRightBack].orientation = (self.corners[.upRightBack].orientation + 1) % 3
            self.corners[.downRightBack].orientation = (self.corners[.downRightBack].orientation + 1) % 3
            self.corners[.downLeftBack].orientation = (self.corners[.downLeftBack].orientation + 1) % 3
        }
    }
}
