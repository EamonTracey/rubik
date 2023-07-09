extension Solver.Thistlethwaite {
    enum Three { }
}

extension Solver.Thistlethwaite.Three: ThistlethwaiteStep {
    static let name = "three"

    static let factor: Int = 29400

    static let allowedTurns: [Turn] = [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.half),
        .left(.half),
        .front(.half),
        .back(.half)
    ]

    @usableFromInline
    static func encode(_ cube: Cube) -> Int {
        var middleSliceCombination: Int = 0
        var firstTetradCombination: Int = 0

        var r = 1
        for (index, edge) in cube.edges[0...7].enumerated() where edge.slice == .middle {
            middleSliceCombination += combinations(index, r)
            r += 1
        }

        r = 1
        for (index, corner) in cube.corners.enumerated() where corner.tetrad == .first {
            firstTetradCombination += combinations(index, r)
            r += 1
        }

        return middleSliceCombination * 420 +
               firstTetradCombination * 6 +
               tetradTwist(cube)
    }
}

fileprivate func tetradTwist(_ cube: Cube) -> Int {
    let raw = cube.corners.map({$0.solvedPosition.rawValue})
    var firsts: [Int] = []
    var seconds: [Int] = []

    for corner in cube.corners {
        if corner.tetrad == .first { firsts.append(corner.solvedPosition.rawValue) }
        else { seconds.append(corner.solvedPosition.rawValue) }
    }

    var tetradsperm = firsts + seconds

    // SOLVE URF
    if tetradsperm[0] == 1 { imitateMove(move: .up(.half), tetradsperm: &tetradsperm) }
    else if tetradsperm[0] == 2 { imitateMove(move: .right(.half), tetradsperm: &tetradsperm) }
    else if tetradsperm[0] == 3 { imitateMove(move: .front(.half), tetradsperm: &tetradsperm) }
    // SOLVE ULB
    if tetradsperm[1] == 2 { imitateMove(move: .back(.half), tetradsperm: &tetradsperm) }
    else if tetradsperm[1] == 3 { imitateMove(move: .left(.half), tetradsperm: &tetradsperm) }
    // SOLVE DRB DLF
    if tetradsperm[2] == 3 { imitateMove(move: .down(.half), tetradsperm: &tetradsperm) }
    // SOLVE URB
    if tetradsperm[4] == 5 {
        imitateMove(move: .up(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .left(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .front(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .left(.half), tetradsperm: &tetradsperm)
    }
    else if tetradsperm[4] == 6 {
        imitateMove(move: .right(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .down(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .front(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .down(.half), tetradsperm: &tetradsperm)
    }
    else if tetradsperm[4] == 7 {
        imitateMove(move: .back(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .right(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .up(.half), tetradsperm: &tetradsperm)
        imitateMove(move: .right(.half), tetradsperm: &tetradsperm)
    }


    let permul = [
        tetradsperm[5],
        tetradsperm[6],
        tetradsperm[7]
    ]

    if permul == [5,6,7]{return 0}
    else if permul == [5,7,6]{return 1}
    else if permul == [6,5,7]{return 2}
    else if permul == [6,7,5]{return 3}
    else if permul == [7,5,6]{return 4}
    else if permul == [7,6,5]{return 5}

    fatalError()
}

fileprivate func imitateMove(move: Turn, tetradsperm: inout [Int]) {
    var indices: [Int] = .init(repeating: 0, count: 4)
    var positions: [Int] = .init(repeating: 0, count: 4)

    switch move {
    case .up(.half):    indices = [1,0,5,4]
    case .down(.half):  indices = [3,2,7,6]
    case .left(.half):  indices = [1,3,5,7]
    case .right(.half): indices = [2,0,6,4]
    case .front(.half): indices = [3,0,5,6]
    case .back(.half):  indices = [1,2,7,4]
    default: fatalError()
    }

    for i in 0..<8 {
        if tetradsperm[i] == indices[0] { positions[0] = i }
        if tetradsperm[i] == indices[1] { positions[1] = i }
        if tetradsperm[i] == indices[2] { positions[2] = i }
        if tetradsperm[i] == indices[3] { positions[3] = i }
    }

    tetradsperm.swapAt(positions[0], positions[1])
    tetradsperm.swapAt(positions[2], positions[3])
}
