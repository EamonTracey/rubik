extension Cube {
    public var isPermutable: Bool {
        var edgeInversions: Int = 0
        var cornerInversions: Int = 0
        
        for (a, elementA) in self.edges.enumerated() {
            for elementB in self.edges[(a + 1)...] {
                if elementA.solvedPosition.rawValue > elementB.solvedPosition.rawValue {
                    edgeInversions += 1
                }
            }
        }
        
        for (a, elementA) in self.corners.enumerated() {
            for elementB in self.corners[(a + 1)...] {
                if elementA.solvedPosition.rawValue > elementB.solvedPosition.rawValue {
                    cornerInversions += 1
                }
            }
        }
        
        return (edgeInversions ^ cornerInversions) & 1 == 0
    }
    
    public var areEdgesOrientable: Bool {
        return self.edges.map { edge in
            edge.solvedPosition.rawValue
        }.reduce(0, ^) == 0
    }
    
    public var areCornersOrientable: Bool {
        return self.corners.map { corner in
            corner.solvedPosition.rawValue
        }.reduce(0, +) % 3 == 0
    }
}
