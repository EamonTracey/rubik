@usableFromInline
func permutePochmannCorners(_ cube: Cube) -> Algorithm {
    var cube = cube
    var cornersAlgorithm = Algorithm.nothing

    while (!cube.areCornersPermuted) {
        let swapPosition: Int

        if cube.corners[.upLeftBack].solvedPosition == .upLeftBack {
            let unsolved = cube.corners.enumerated().first { (index, corner) in
                index != corner.solvedPosition.rawValue
            }!
            swapPosition = unsolved.offset
        } else {
            swapPosition = cube.corners[.upLeftBack].solvedPosition.rawValue
        }

        let setupAlgorithm = setupMap[swapPosition * 3 + cube.corners[.upLeftBack].orientation.rawValue]
        let commutator = setupAlgorithm + yPerm + setupAlgorithm.reversed

        cornersAlgorithm += commutator
        cube.execute(commutator)
    }

    return cornersAlgorithm
}

@usableFromInline
func orientPochmannCorners(_ cube: Cube) -> Algorithm {
    var cube = cube
    var algorithm = Algorithm.nothing

    while let swapPosition = cube.corners.enumerated().first(where: { (index, corner) in
        corner.orientation != .correct && index != Cube.Corner.Position.upLeftBack.rawValue
    })?.offset {
        let setupAlgorithm = setupMap[swapPosition * 3]
        let commutator = setupAlgorithm + yPerm + setupAlgorithm.reversed

        algorithm += commutator
        cube.execute(commutator)

        let permuteAlgorithm = permutePochmannCorners(cube)

        algorithm += permuteAlgorithm
        cube.execute(permuteAlgorithm)
    }

    return algorithm
}

fileprivate let yPerm = Algorithm("R U' R' U' R U R' F' R U R' U' R' F R")!

fileprivate let setupMap: [Algorithm] = [
    Algorithm("F")!,     Algorithm("F2 D")!, Algorithm("R'")!,
    .nothing,            .nothing,           .nothing,
    Algorithm("D2 F'")!, Algorithm("D'")!,   Algorithm("R")!,
    Algorithm("F'")!,    Algorithm("D")!,    Algorithm("D2 R")!,
    Algorithm("R D'")!,  Algorithm("R2")!,   Algorithm("R' F")!,
    Algorithm("F R'")!,  Algorithm("F2")!,   Algorithm("F' D")!,
    Algorithm("F' R'")!, .nothing,           Algorithm("D R")!,
    Algorithm("D F'")!,  Algorithm("D2")!,   Algorithm("D' R")!
]
