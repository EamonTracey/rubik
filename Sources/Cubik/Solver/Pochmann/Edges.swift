@usableFromInline
func permutePochmannEdges(_ cube: Cube) -> Algorithm {
    var cube = cube
    var algorithm = Algorithm.nothing

    while (!cube.areEdgesPermuted) {
        let swapPosition: Int

        if cube.edges[.upRight].solvedPosition == .upRight {
            let unsolved = cube.edges.enumerated().first { (index, edge) in
                index != edge.solvedPosition.rawValue
            }!
            swapPosition = unsolved.offset
        } else {
            swapPosition = cube.edges[.upRight].solvedPosition.rawValue
        }

        let setupAlgorithm = setupMap[swapPosition * 2 + cube.edges[.upRight].orientation.rawValue]
        let commutator = setupAlgorithm + tPerm + setupAlgorithm.reversed

        algorithm += commutator
        cube.execute(commutator)
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

