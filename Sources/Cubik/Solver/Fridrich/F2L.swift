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
    var cornerEnforcementAlgorithm = Algorithm.nothing
    var edgeEnforcementAlgorithmOne = Algorithm.nothing
    var edgeEnforcementAlgorithmTwo = Algorithm.nothing

    let cornerPosition = cube.corners.firstIndex { $0.solvedPosition == .downRightFront}!
    switch cornerPosition {
    case Cube.Corner.Position.upRightBack.rawValue:
        cornerEnforcementAlgorithm.turns.append(.up(.clockwise))
    case Cube.Corner.Position.upLeftFront.rawValue:
        cornerEnforcementAlgorithm.turns.append(.up(.counterclockwise))
    case Cube.Corner.Position.upLeftBack.rawValue:
        cornerEnforcementAlgorithm.turns.append(.up(.half))
    case Cube.Corner.Position.downRightBack.rawValue:
        cornerEnforcementAlgorithm = Algorithm("R' U' R U2")!
    case Cube.Corner.Position.downLeftFront.rawValue:
        cornerEnforcementAlgorithm = Algorithm("L' U' L")!
    case Cube.Corner.Position.downLeftBack.rawValue:
        cornerEnforcementAlgorithm = Algorithm("L U2 L'")!
    default:
        break
    }
    cube.execute(cornerEnforcementAlgorithm)

    let edgePositionOne = cube.edges.firstIndex { $0.solvedPosition == .rightFront }!
    switch edgePositionOne {
    case Cube.Edge.Position.rightBack.rawValue:
        edgeEnforcementAlgorithmOne = Algorithm("R' U' R")!
    case Cube.Edge.Position.leftFront.rawValue:
        edgeEnforcementAlgorithmOne = Algorithm("F' U F")!
    case Cube.Edge.Position.leftBack.rawValue:
        edgeEnforcementAlgorithmOne = Algorithm("L U' L' U")!
    default:
        break
    }
    cube.execute(edgeEnforcementAlgorithmOne)

    let edgePositionTwo = cube.edges.firstIndex { $0.solvedPosition == .rightFront }!
    let edgeOrientation = cube.edges[edgePositionTwo].orientation
    if cornerPosition == Cube.Corner.Position.downRightFront.rawValue {

        print("hello?")

        if edgePositionTwo == Cube.Edge.Position.upLeft.rawValue && edgeOrientation == .correct {
            edgeEnforcementAlgorithmTwo.turns.append(.up(.half))
        } else if edgePositionTwo == Cube.Edge.Position.upLeft.rawValue && edgeOrientation == .flipped {
            edgeEnforcementAlgorithmTwo.turns.append(.up(.counterclockwise))
        } else if edgePositionTwo == Cube.Edge.Position.upBack.rawValue && edgeOrientation == .correct {
            edgeEnforcementAlgorithmTwo.turns.append(.up(.clockwise))
        } else if edgePositionTwo == Cube.Edge.Position.upBack.rawValue && edgeOrientation == .flipped {
            edgeEnforcementAlgorithmTwo.turns.append(.up(.half))
        } else if edgePositionTwo == Cube.Edge.Position.upRight.rawValue && edgeOrientation == .flipped {
            edgeEnforcementAlgorithmTwo.turns.append(.up(.clockwise))
        } else if edgePositionTwo == Cube.Edge.Position.upFront.rawValue && edgeOrientation == .correct {
            edgeEnforcementAlgorithmTwo.turns.append(.up(.counterclockwise))
        }

    }

    cube.execute(edgeEnforcementAlgorithmTwo)

    return cornerEnforcementAlgorithm + edgeEnforcementAlgorithmOne + edgeEnforcementAlgorithmTwo
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
