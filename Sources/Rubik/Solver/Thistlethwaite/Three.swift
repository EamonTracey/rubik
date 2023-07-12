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
