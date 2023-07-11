@_spi(Tables)
@inlinable
public func encodeThistlethwaiteFour(_ cube: Cube) -> Int {
    var standingSlicePermutation: Int = 0
    var middleSlicePermutation: Int = 0
    var equatorialSlicePermutation: Int = 0
    var firstTetradPermutation: Int = 0
    var secondTetradPermutation: Int = 0

    encodePermutation(of: cube.edges[0...3], n: 4)

    for (index, edgeA) in cube.edges[4...7].enumerated() {
        middleSlicePermutation *= 4 - index
        for edgeB in cube.edges[(index + 4)...7] where edgeA.solvedPosition > edgeB.solvedPosition {
            middleSlicePermutation += 1
        }
    }


    for (index, edgeA) in cube.edges[8...9].enumerated() {
        equatorialSlicePermutation *= 4 - index
        for edgeB in cube.edges[(index + 8)...11] where edgeA.solvedPosition > edgeB.solvedPosition {
            equatorialSlicePermutation += 1
        }
    }

    for (index, cornerA) in cube.corners[0...3].enumerated() {
        firstTetradPermutation *= 4 - index
        for cornerB in cube.corners[index...3] where cornerA.solvedPosition > cornerB.solvedPosition {
            firstTetradPermutation += 1
        }
    }

    secondTetradPermutation = cube.corners[4].solvedPosition.rawValue - 4

    return standingSlicePermutation +
           middleSlicePermutation * 24 +
           equatorialSlicePermutation * 576 +
           firstTetradPermutation * 6912 +
           secondTetradPermutation * 165888
}
