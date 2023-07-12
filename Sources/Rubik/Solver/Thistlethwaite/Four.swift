@_spi(Tables)
@inlinable
public func encodeThistlethwaiteFour(_ cube: Cube) -> Int {
    let standingSlicePermutation = encodePermutation(of: cube.edges[0...3], n: 4)

    let middleSlicePermutation = encodePermutation(of: cube.edges[4...7], n: 4)

    let equatorialSlicePermutation = encodePermutation(of: cube.edges[8...11], n: 2)

    let firstTetradPermutation = encodePermutation(of: cube.corners[0...3], n: 4)

    let secondTetradPermutation = cube.corners[4].solvedPosition.rawValue - 4

    return standingSlicePermutation + middleSlicePermutation * 24 + equatorialSlicePermutation * 576 +
      firstTetradPermutation * 6912 + secondTetradPermutation * 165888
}
