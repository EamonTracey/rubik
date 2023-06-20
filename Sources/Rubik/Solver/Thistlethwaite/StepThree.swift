public let thistlethwaiteThreeLimit: Int = 1000000000

public let thistlethwaiteThreeAllowedTurns: [Turn] = [
    .up(.clockwise), .up(.half), .up(.counterclockwise),
    .down(.clockwise), .down(.half), .down(.counterclockwise),
    .right(.half),
    .left(.half),
    .front(.half),
    .back(.half)
]

@inlinable
public func encodeThistlethwaiteThree(_ cube: Cube) -> Int {
    var encodedMiddleSliceEdgeCombination: Int = 0
    var encodedFirstTetradCornerCombination: Int = 0
    
    for (index, edge) in cube.edges[0...7].enumerated() {
        if edge.solvedPosition.rawValue - 4 >= 0 {
            encodedMiddleSliceEdgeCombination |= 256 << index
        }
    }
    
    for (index, corner) in cube.corners.enumerated() {
        if corner.solvedPosition.rawValue - 4 >= 0 {
            encodedFirstTetradCornerCombination |= 1 << index
        }
    }
    
    var tp = tetradParity(cube) << 50
    assert(encodedMiddleSliceEdgeCombination & encodedFirstTetradCornerCombination == 0)
    assert(tp & (encodedMiddleSliceEdgeCombination + encodedFirstTetradCornerCombination) == 0)
    
    return encodedMiddleSliceEdgeCombination + encodedFirstTetradCornerCombination + tp
}

@inlinable
public func tetradParity(_ cube: Cube) -> Int {
    var cube = cube
    var one: Int
    var two: Int
    
    // manually put corners into tetrads
    var goods: [Cube.Corner] = []
    var bads: [Cube.Corner] = []
    for corner in cube.corners {
        if corner.solvedPosition.rawValue - 4 >= 0 {
            bads.append(corner)
        } else {
            goods.append(corner)
        }
    }
    cube.corners[.upRightFront] = goods[0]
    cube.corners[.upLeftBack] = goods[1]
    cube.corners[.downRightBack] = goods[2]
    cube.corners[.downLeftFront] = goods[3]
    cube.corners[.upRightBack] = bads[0]
    cube.corners[.upLeftFront] = bads[1]
    cube.corners[.downRightFront] = bads[2]
    cube.corners[.downLeftBack] = bads[3]
    // solve urf
    if cube.corners[.upLeftBack].solvedPosition == .upRightFront {
        cube.turn(Turn("U2")!)
    } else if cube.corners[.downRightBack].solvedPosition == .upRightFront {
        cube.turn(Turn("R2")!)
    } else if cube.corners[.downLeftFront].solvedPosition == .upRightFront {
        cube.turn(Turn("F2")!)
    }
    // solve dlb
    if cube.corners[.upRightBack].solvedPosition == .downLeftBack {
        cube.turn(Turn("B2")!)
    } else if cube.corners[.upLeftFront].solvedPosition == .downLeftBack {
        cube.turn(Turn("L2")!)
    } else if cube.corners[.downRightFront].solvedPosition == .downLeftBack {
        cube.turn(Turn("D2")!)
    }
    
    assert(cube.corners[.upRightFront].solvedPosition == .upRightFront)
    assert(cube.corners[.downLeftBack].solvedPosition == .downLeftBack)
    
    let (x, y, z) = (cube.corners[.upLeftBack].solvedPosition.rawValue, cube.corners[.downRightBack].solvedPosition.rawValue, cube.corners[.downLeftFront].solvedPosition.rawValue)
    if x < y && y < z {
        one = 0
    } else if x < z && z < y {
        one = 1
    } else if y < x && x < z {
        one = 2
    } else if y < z && z < x {
        one = 3
    } else if z < x && x < y {
        one = 4
    } else {
        one = 5
    }
    
    let (a, b, c) = (cube.corners[.downRightFront].solvedPosition.rawValue, cube.corners[.upLeftFront].solvedPosition.rawValue, cube.corners[.upRightBack].solvedPosition.rawValue)
    if a < b && b < c {
        two = 0
    } else if a < c && c < b {
        two = 1
    } else if b < a && a < c {
        two = 2
    } else if b < c && c < a {
        two = 3
    } else if c < a && a < b {
        two = 4
    } else {
        two = 5
    }
    
    return abs(one - two)
}

public extension Solver {
    @inlinable
    func generateThistlethwaiteThreeTable() -> [Int: Algorithm] {
        return self.thistlethwaiteTraversal(
            factor: thistlethwaiteThreeLimit,
            allowedTurns: thistlethwaiteThreeAllowedTurns,
            stateEncoding: encodeThistlethwaiteThree
        )
    }
}
