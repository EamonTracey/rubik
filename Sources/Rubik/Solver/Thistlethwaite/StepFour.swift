public let thistlethwaiteFourLimit: Int = 1000000000//663552

public let thistlethwaiteFourAllowedTurns: [Turn] = [
    .up(.half),
    .down(.half),
    .right(.half),
    .left(.half),
    .front(.half),
    .back(.half)
]

@inlinable
public func encodeThistlethwaiteFour(_ cube: Cube) -> Int {
    var encodedEgePermutation: Int = 0
    var encodedCornerPermutation: Int = 0
    
//    encodedEgePermutation += cube.edges[0].solvedPosition.rawValue * 262144
    encodedEgePermutation += cube.edges[1].solvedPosition.rawValue * 3145728
    encodedEgePermutation += cube.edges[2].solvedPosition.rawValue * 37748736
    encodedEgePermutation += cube.edges[3].solvedPosition.rawValue * 452984832
//    encodedEgePermutation += cube.edges[4].solvedPosition.rawValue * 5435817984
    encodedEgePermutation += cube.edges[5].solvedPosition.rawValue * 65229815808
    encodedEgePermutation += cube.edges[6].solvedPosition.rawValue * 782757789696
    encodedEgePermutation += cube.edges[7].solvedPosition.rawValue * 9393093476352
    encodedEgePermutation += cube.edges[8].solvedPosition.rawValue * 112717121716224
    encodedEgePermutation += cube.edges[9].solvedPosition.rawValue * 1352605460594688
    
//    encodedCornerPermutation += cube.corners[0].solvedPosition.rawValue
    encodedCornerPermutation += cube.corners[1].solvedPosition.rawValue * 8
    encodedCornerPermutation += cube.corners[2].solvedPosition.rawValue * 64
    encodedCornerPermutation += cube.corners[3].solvedPosition.rawValue * 512
    encodedCornerPermutation += cube.corners[4].solvedPosition.rawValue * 4096
//    encodedCornerPermutation += cube.corners[5].solvedPosition.rawValue * 32768
    
    return encodedEgePermutation + encodedCornerPermutation
}

public extension Solver {
    @inlinable
    func generateThistlethwaiteFourTable() -> [Int: Algorithm] {
        return self.thistlethwaiteTraversal(
            factor: thistlethwaiteFourLimit,
            allowedTurns: thistlethwaiteFourAllowedTurns,
            stateEncoding: encodeThistlethwaiteFour
        )
    }
}

