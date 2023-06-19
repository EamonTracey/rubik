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
    
    var tp = tetradParity(cube)
    
    return encodedMiddleSliceEdgeCombination + encodedFirstTetradCornerCombination + (tp << 58)
}

@inlinable
public func tetradParity(_ cube: Cube) -> Int {
    var cube = cube
    
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
    // solve ulb
    if cube.corners[.downRightBack].solvedPosition == .upLeftBack {
        cube.turn(Turn("B2")!)
    } else if cube.corners[.downLeftFront].solvedPosition == .upLeftBack {
        cube.turn(Turn("L2")!)
    }
    // solve drb (and thus dlf)
    if cube.corners[.downLeftFront].solvedPosition == .downRightBack {
        cube.turn(Turn("D2")!)
    }
    // solve urb
    if cube.corners[.upLeftFront].solvedPosition == .upRightBack {
        cube.execute(Algorithm("F2 L2 F2 U2")!)
    } else if cube.corners[.downRightFront].solvedPosition == .upRightBack {
        cube.execute(Algorithm("U2 F2 U2 L2")!)
    } else if cube.corners[.downLeftBack].solvedPosition == .upRightBack {
        cube.execute(Algorithm("L2 U2 L2 F2")!)
    }
    // sanity check
    assert(cube.corners[.upRightFront].solvedPosition == .upRightFront)
    assert(cube.corners[.upLeftBack].solvedPosition == .upLeftBack)
    assert(cube.corners[.downRightBack].solvedPosition == .downRightBack)
    assert(cube.corners[.downLeftFront].solvedPosition == .downLeftFront)
    assert(cube.corners[.upRightBack].solvedPosition == .upRightBack)
    
    let perm = [ cube.corners[.upLeftFront].solvedPosition, cube.corners[.downRightFront].solvedPosition, cube.corners[.downLeftBack].solvedPosition ]
    if perm == [ .upLeftFront, .downRightFront, .downLeftBack ] { return 0 }
    else if perm == [ .upLeftFront, .downLeftBack, .downRightFront ] { return 1 }
    else if perm == [ .downRightFront, .upLeftFront, .downLeftBack ] { return 2 }
    else if perm == [ .downRightFront, .downLeftBack, .upLeftFront ] { return 3 }
    else if perm == [ .downLeftBack, .upLeftFront, .downRightFront ] { return 4 }
    else if perm == [ .downLeftBack, .downRightFront, .upLeftFront ] { return 5 }
    else { fatalError("wtf") }
//    print(cube.corners[.upRightBack].solvedPosition.rawValue, cube.corners[.downRightFront].solvedPosition.rawValue, cube.corners[.downLeftBack].solvedPosition.rawValue)
    // permutation of ulf, drf, dlb
    var tp: Int = 0
    tp += (cube.corners[.upLeftFront].solvedPosition.rawValue - 5)
    tp += (cube.corners[.downRightFront].solvedPosition.rawValue - 5) * 3
    tp += (cube.corners[.downLeftBack].solvedPosition.rawValue - 5) * 9
//    print(tp)
    return tp
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
