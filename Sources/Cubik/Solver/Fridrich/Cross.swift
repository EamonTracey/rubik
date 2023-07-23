@_spi(Tables)
@inlinable
public func encodeCross(_ cube: Cube) -> Int {
    var edges = cube.edges
    var crossEdges = Array(repeating: 0, count: 4)

    for (positionIndex, position) in [Cube.Edge.Position.downRight, .downLeft, .downFront, .downBack].enumerated() {
        for (edgeIndex, edge) in edges.enumerated() where position == edge.solvedPosition {
            crossEdges[positionIndex] = edgeIndex + (12 - positionIndex) * edge.orientation.rawValue
            edges.remove(at: edgeIndex)
            break
        }
    }

    return crossEdges[0] + crossEdges[1] * 24 + crossEdges[2] * 528 + crossEdges[3] * 10560
}
