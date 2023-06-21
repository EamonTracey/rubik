extension Cube {
    public var areEdgesValid: Bool {
        return Set(self.edges.map { edge in
            edge.solvedPosition
        }).count == 12
    }
    
    public var areCornersValid: Bool {
        return Set(self.corners.map { corner in
            corner.solvedPosition
        }).count == 8
    }
    
    public var isValid: Bool {
        return self.areEdgesValid && self.areCornersValid
    }
}
