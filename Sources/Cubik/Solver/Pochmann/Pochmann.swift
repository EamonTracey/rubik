@usableFromInline
class Pochmann { }

extension Pochmann {
    @usableFromInline
    func solve(_ cube: Cube) -> Algorithm {
        var cube = cube

        let permuteEdgesAlgorithm = permutePochmannEdges(cube)
        cube.execute(permuteEdgesAlgorithm)

        let permuteCornersAlgorithm = permutePochmannCorners(cube)
        cube.execute(permuteCornersAlgorithm)

        return permuteEdgesAlgorithm + permuteCornersAlgorithm
    }
}
