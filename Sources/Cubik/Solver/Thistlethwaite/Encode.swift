@_spi(Tables)
@inlinable
public func encodeThistlethwaiteOne(_ cube: Cube) -> Int {
    let edgeOrientation = cube.edges[0].orientation.rawValue + cube.edges[1].orientation.rawValue * 2 +
      cube.edges[2].orientation.rawValue * 4 + cube.edges[3].orientation.rawValue * 8 +
      cube.edges[4].orientation.rawValue * 16 + cube.edges[5].orientation.rawValue * 32 +
      cube.edges[6].orientation.rawValue * 64 + cube.edges[7].orientation.rawValue * 128 +
      cube.edges[8].orientation.rawValue * 256 + cube.edges[9].orientation.rawValue * 512 +
      cube.edges[10].orientation.rawValue * 1024

    return edgeOrientation
}

@_spi(Tables)
@inlinable
public func encodeThistlethwaiteTwo(_ cube: Cube) -> Int {
    let cornerOrientation = cube.corners[0].orientation.rawValue + cube.corners[1].orientation.rawValue * 3 +
      cube.corners[2].orientation.rawValue * 9 + cube.corners[3].orientation.rawValue * 27 +
      cube.corners[4].orientation.rawValue * 81 + cube.corners[5].orientation.rawValue * 243 +
      cube.corners[6].orientation.rawValue * 729

    let equatorialSliceCombination = encodeCombination(of: cube.edges) { edge in
        edge.slice == .equatorial
    }

    return cornerOrientation + equatorialSliceCombination * 2187
}

@_spi(Tables)
@inlinable
public func encodeThistlethwaiteThree(_ cube: Cube) -> Int {
    let middleSliceCombination = encodeCombination(of: cube.edges) { edge in
        edge.slice == .middle
    }

    let firstTetradCombination = encodeCombination(of: cube.corners) { corner in
        corner.tetrad == .first
    }

    let twist = tetradTwist(cube)

    return middleSliceCombination + firstTetradCombination * 70 + twist * 4900
}

@_spi(Tables)
@inlinable
public func encodeThistlethwaiteFour(_ cube: Cube) -> Int {
    let standingSlicePermutation = encodePermutation(of: Array(cube.edges[0...3]), n: 4)

    let middleSlicePermutation = encodePermutation(of: Array(cube.edges[4...7]), n: 4)

    let equatorialSlicePermutation = encodePermutation(of: Array(cube.edges[8...11]), n: 2)

    let firstTetradPermutation = encodePermutation(of: Array(cube.corners[0...3]), n: 4)

    let secondTetradPermutation = cube.corners[4].solvedPosition.rawValue - 4

    return standingSlicePermutation + middleSlicePermutation * 24 + equatorialSlicePermutation * 576 +
      firstTetradPermutation * 6912 + secondTetradPermutation * 165888
}
