@usableFromInline
func solveF2L(_ cube: Cube) -> Algorithm {
    var cube = cube
    var f2lAlgorithm = Algorithm.nothing

    for _ in 0..<4 {
        let enforcementAlgorithm = enforceF2LCase(cube)

        f2lAlgorithm += enforcementAlgorithm
        cube.execute(enforcementAlgorithm)

        for algorithm in f2lAlgorithms {
            cube.execute(algorithm)
            if cube.edges[.rightFront] == .init(orientation: .correct, solvedPosition: .rightFront) &&
               cube.corners[.downRightFront] == .init(orientation: .correct, solvedPosition: .downRightFront) {
                f2lAlgorithm += algorithm
                break
            }
            cube.execute(algorithm.reversed)
        }

        f2lAlgorithm.turns.append(.yAxis(.clockwise))
        cube.turn(.yAxis(.clockwise))
    }

    return f2lAlgorithm
}

fileprivate func enforceF2LCase(_ cube: Cube) -> Algorithm {
    var cube = cube
    var cornerUpEnforcement = Algorithm.nothing
    var edgeUpEnforcement = Algorithm.nothing
    var edgeAUFEnforcement = Algorithm.nothing

    let cornerPosition = cube.corners.firstIndex { $0.solvedPosition == .downRightFront}!
    switch cornerPosition {
    case Cube.Corner.Position.upRightBack.rawValue:
        cornerUpEnforcement.turns.append(.up(.clockwise))
    case Cube.Corner.Position.upLeftFront.rawValue:
        cornerUpEnforcement.turns.append(.up(.counterclockwise))
    case Cube.Corner.Position.upLeftBack.rawValue:
        cornerUpEnforcement.turns.append(.up(.half))
    case Cube.Corner.Position.downRightBack.rawValue:
        cornerUpEnforcement = Algorithm("R' U' R U2")!
    case Cube.Corner.Position.downLeftFront.rawValue:
        cornerUpEnforcement = Algorithm("L' U' L")!
    case Cube.Corner.Position.downLeftBack.rawValue:
        cornerUpEnforcement = Algorithm("L U2 L'")!
    default:
        break
    }
    cube.execute(cornerUpEnforcement)

    let edgePositionOne = cube.edges.firstIndex { $0.solvedPosition == .rightFront }!
    switch edgePositionOne {
    case Cube.Edge.Position.rightBack.rawValue:
        edgeUpEnforcement = Algorithm("R' U' R")!
    case Cube.Edge.Position.leftFront.rawValue:
        edgeUpEnforcement = Algorithm("F U F'")!
    case Cube.Edge.Position.leftBack.rawValue:
        edgeUpEnforcement = Algorithm("L U' L' U")!
    default:
        break
    }
    cube.execute(edgeUpEnforcement)

    let edgePositionTwo = cube.edges.firstIndex { $0.solvedPosition == .rightFront }!
    let edgeOrientation = cube.edges[edgePositionTwo].orientation
    if cornerPosition == Cube.Corner.Position.downRightFront.rawValue {
        switch (edgePositionTwo, edgeOrientation) {
        case (Cube.Edge.Position.upRight.rawValue, .flipped), (Cube.Edge.Position.upBack.rawValue, .correct):
            edgeAUFEnforcement.turns.append(.up(.clockwise))
        case (Cube.Edge.Position.upLeft.rawValue, .correct), (Cube.Edge.Position.upBack.rawValue, .flipped):
            edgeAUFEnforcement.turns.append(.up(.half))
        case (Cube.Edge.Position.upLeft.rawValue, .flipped), (Cube.Edge.Position.upFront.rawValue, .correct):
            edgeAUFEnforcement.turns.append(.up(.counterclockwise))
        default:
            break
        }
    }
    cube.execute(edgeAUFEnforcement)

    return cornerUpEnforcement + edgeUpEnforcement + edgeAUFEnforcement
}

fileprivate var f2lAlgorithms: [Algorithm] = [
    .nothing,
    Algorithm("y F R U2 R' F' y'")!,
    Algorithm("F' L' U2 L F")!,
    Algorithm("U R U2 R' U R U' R'")!,
    Algorithm("y U' L' U2 L U' L' U L y'")!,
    Algorithm("U F R' F' R U R U R'")!,
    Algorithm("F U R U' R' F' R U' R'")!,
    Algorithm("R U2 R' U' R U R'")!,
    Algorithm("y L' U2 L U L' U' L y'")!,
    Algorithm("R U R'")!,
    Algorithm("y L' U' L y'")!,
    Algorithm("U' R U R' U R U R'")!,
    Algorithm("y U L' U' L U' L' U' L y'")!,
    Algorithm("R' U2 R2 U R2 U R")!,
    Algorithm("y L U2 L2 U' L2 U' L' y'")!,
    Algorithm("U' R U' R' U R U R'")!,
    Algorithm("y U L' U L U' L' U' L y'")!,
    Algorithm("y U' L' U L y'")!,
    Algorithm("U R U' R'")!,
    Algorithm("y U L' U2 L U2 L' U L y'")!,
    Algorithm("U' R U2 R' U2 R U' R'")!,
    Algorithm("U' R U R' U2 R U' R'")!,
    Algorithm("y U L' U' L U2 L' U L y'")!,
    Algorithm("M U L F' L' U' M'")!,
    Algorithm("y M U' R' F R U M' y'")!,
    Algorithm("U R U R' U2 R U R'")!,
    Algorithm("U' R U' R' U2 R U' R'")!,
    Algorithm("U F' U' F U' R U R'")!,
    Algorithm("U2 R U R' F R' F' R")!,
    Algorithm("U R U' R' U R U' R' U R U' R'")!,
    Algorithm("U' R' F R F' R U' R'")!,
    Algorithm("R U R' U' R U R'")!,
    Algorithm("y L' U' L U L' U' L y'")!,
    Algorithm("R U' R' U R U' R'")!,
    Algorithm("y L' U L U' L' U L y'")!,
    Algorithm("U' R' F R F' R U R'")!,
    Algorithm("y U L F' L' F L' U' L y'")!,
    Algorithm("R U' R' U R U2 R' U R U' R'")!,
    Algorithm("R U' R' U' R U R' U2 R U' R'")!,
    Algorithm("R U' R' F' L' U2 L F")!,
    Algorithm("F' L' U2 L F R U R'")!,
    Algorithm("R2 U2 F R2 F' U2 R' U R'")!,
]
