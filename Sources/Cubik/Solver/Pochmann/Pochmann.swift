@usableFromInline
class Pochmann { }

extension Pochmann {
    @usableFromInline
    func solve(_ cube: Cube) -> Algorithm {
        var cube = cube

        let permuteEdgesAlgorithm = permutePochmannEdges(cube)
        cube.execute(permuteEdgesAlgorithm)

        let orientEdgesAlgorithm = orientPochmannEdges(cube)
        cube.execute(orientEdgesAlgorithm)

        let permuteCornersAlgorithm = permutePochmannCorners(cube)
        cube.execute(permuteCornersAlgorithm)

        let orientCornersAlgorithm = orientPochmannCorners(cube)
        cube.execute(orientCornersAlgorithm)

        return permuteEdgesAlgorithm + orientEdgesAlgorithm + permuteCornersAlgorithm + orientCornersAlgorithm
    }
}
