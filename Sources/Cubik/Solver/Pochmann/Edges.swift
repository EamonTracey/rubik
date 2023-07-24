@usableFromInline
func permutePochmannEdges(_ cube: Cube) -> Algorithm {
    var cube = cube
    var edgesAlgorithm = Algorithm.nothing

    while (!cube.areEdgesPermuted) {
        let swapPosition: Int

        if cube.edges[.upRight].solvedPosition == .upRight {
            swapPosition = cube.edges.enumerated().first { (index, edge) in
                index != edge.solvedPosition.rawValue
            }!.offset
        } else {
            swapPosition = cube.edges[.upRight].solvedPosition.rawValue
        }

        let setupAlgorithm = setupMap[swapPosition * 2 + cube.edges[.upRight].orientation.rawValue]
        let commutator = setupAlgorithm + tPerm + setupAlgorithm.reversed

        edgesAlgorithm += commutator
        cube.execute(commutator)
    }

    return edgesAlgorithm
}

@usableFromInline
func orientPochmannEdges(_ cube: Cube) -> Algorithm {
    var cube = cube
    var algorithm = Algorithm.nothing

    while let swapPosition = cube.edges.enumerated().first(where: { (index, edge) in
        edge.orientation != .correct && index != Cube.Edge.Position.upRight.rawValue
    })?.offset {
        let setupAlgorithm = setupMap[swapPosition * 2]
        let commutator = setupAlgorithm + tPerm + setupAlgorithm.reversed

        algorithm += commutator
        cube.execute(commutator)

        let permuteAlgorithm = permutePochmannEdges(cube)

        algorithm += permuteAlgorithm
        cube.execute(permuteAlgorithm)
    }

    return algorithm
}

fileprivate let tPerm = Algorithm("R U R' U' R' F R2 U' R' U' R U R' F'")!

fileprivate let setupMap: [Algorithm] = [
    .nothing,               .nothing,
    .nothing,               Algorithm("L U' F U")!,
    Algorithm("D2 L2")!,    Algorithm("D' F L' F'")!,
    Algorithm("L2")!,       Algorithm("L' U' F U")!,
    Algorithm("M2 D L2")!,  Algorithm("M D' L2")!,
    Algorithm("M2 D' L2")!, Algorithm("M' D L2")!,
    Algorithm("D' L2")!,    Algorithm("F L' F'")!,
    Algorithm("D L2")!,     Algorithm("B' L B")!,
    Algorithm("U2 R U2")!,  Algorithm("U' F' U")!,
    Algorithm("U2 R' U2")!, Algorithm("U B U'")!,
    Algorithm("L'")!,       Algorithm("U' F U")!,
    Algorithm("L")!,        Algorithm("U B' U'")!,
]

