extension Solver.Thistlethwaite {
    public enum Three { }
}

extension Solver.Thistlethwaite.Three: ThistlethwaiteStep {
    static let name = "three"

    static let factor: Int = 29400

    public static let allowedTurns: [Turn] = [
        .up(.clockwise), .up(.half), .up(.counterclockwise),
        .down(.clockwise), .down(.half), .down(.counterclockwise),
        .right(.half),
        .left(.half),
        .front(.half),
        .back(.half)
    ]

//    @usableFromInline
    public static func encode(_ cube: Cube) -> Int {
        var middleSliceCombination: Int = 0
        var firstTetradCombination: Int = 0

        var r = 1
        for (index, edge) in cube.edges[0...7].enumerated() where edge.slice == .middle {
            middleSliceCombination += binomial(index, r)
            r += 1
        }

        r = 1
        for (index, corner) in cube.corners.enumerated() where corner.tetrad == .first {
            firstTetradCombination += binomial(index, r)
            r += 1
        }

        return (middleSliceCombination * 70 + firstTetradCombination) * 6 + tetradParity(cube)
    }
}



fileprivate func tetradParity(_ cube: Cube) -> Int {
    let raw = cube.corners.map({$0.solvedPosition.rawValue})
    var flipit: [Int] = .init(repeating: 8, count: 8)
    var firsts: [Int] = []
    var seconds: [Int] = []

    flipit[0] = getIndexOf(value: 0, array: raw)
    flipit[1] = getIndexOf(value: 1, array: raw)
    flipit[2] = getIndexOf(value: 2, array: raw)
    flipit[3] = getIndexOf(value: 3, array: raw)
    flipit[4] = getIndexOf(value: 4, array: raw)
    flipit[5] = getIndexOf(value: 5, array: raw)
    flipit[6] = getIndexOf(value: 6, array: raw)
    flipit[7] = getIndexOf(value: 7, array: raw)

    for element in flipit {
        if element <= 3 { firsts.append(element) }
        else { seconds.append(element) }
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

    // 0 -> 1
    // 1 -> 5
    // 2 -> 3
    // 3 -> 7
    // 4 -> 2
    // 5 -> 6
    // 6 -> 0
    // 7 -> 4

    switch move {
    case .up(.half):    indices = [1,0,5,4]//[0,6,1,7]
    case .down(.half):  indices = [3,2,7,6]//[2,4,3,5]
    case .left(.half):  indices = [1,3,5,7]//[0,2,1,3]
    case .right(.half): indices = [2,0,6,4]//[4,6,5,7]
    case .front(.half): indices = [3,0,5,6]//[2,6,1,5]
    case .back(.half):  indices = [1,2,7,4]//[0,4,3,7]
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

fileprivate func getIndexOf(value: Int, array: [Int]) -> Int {
    for (index, element) in array.enumerated() {
        if element == value {
            return index
        }
    }
    fatalError()
}
