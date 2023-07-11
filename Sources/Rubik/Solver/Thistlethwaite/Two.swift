@_spi(Tables)
@inlinable
public func encodeThistlethwaiteTwo(_ cube: Cube) -> Int {
    let cornerOrientation = cube.corners[0].orientation.rawValue +
                            cube.corners[1].orientation.rawValue * 3 +
                            cube.corners[2].orientation.rawValue * 9 +
                            cube.corners[3].orientation.rawValue * 27 +
                            cube.corners[4].orientation.rawValue * 81 +
                            cube.corners[5].orientation.rawValue * 243 +
                            cube.corners[6].orientation.rawValue * 729

    let equatorialSliceCombination = encodeCombination(of: cube.edges) { edge in
        edge.slice == .equatorial
    }

    return cornerOrientation + equatorialSliceCombination * 2187
}
