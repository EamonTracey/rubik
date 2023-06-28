internal let thistlethwaiteThreeLimit: Int = 1000000000

internal let thistlethwaiteThreeAllowedTurns: [Turn] = [
    .up(.clockwise), .up(.half), .up(.counterclockwise),
    .down(.clockwise), .down(.half), .down(.counterclockwise),
    .right(.half),
    .left(.half),
    .front(.half),
    .back(.half)
]

@usableFromInline
internal func encodeThistlethwaiteThree(_ cube: Cube) -> Int {
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

// TODO: Clean
private func tetradParity(_ cube: Cube) -> Int {
    // manually put corners into tetrads
    var cube = cube
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
//    // solve urb
//    if cube.corners[.upLeftFront].solvedPosition == .upRightBack {
//        cube.execute(Algorithm("F2 L2 F2 U2")!)
//    } else if cube.corners[.downRightFront].solvedPosition == .upRightBack {
//        cube.execute(Algorithm("U2 F2 U2 L2")!)
//    } else if cube.corners[.downLeftBack].solvedPosition == .upRightBack {
//        cube.execute(Algorithm("L2 U2 L2 F2")!)
//    }
    // solve dlb
    if cube.corners[.upRightBack].solvedPosition == .downLeftBack {
        cube.execute(Algorithm("L2 U2 L2 F2")!)
    } else if cube.corners[.upLeftFront].solvedPosition == .downLeftBack {
        cube.execute(Algorithm("U2 F2 U2 L2")!)
    } else if cube.corners[.downRightFront].solvedPosition == .downLeftBack {
        cube.execute(Algorithm("F2 L2 F2 U2")!)
    }
    // sanity check
    assert(cube.corners[.upRightFront].solvedPosition == .upRightFront)
    assert(cube.corners[.upLeftBack].solvedPosition == .upLeftBack)
    assert(cube.corners[.downRightBack].solvedPosition == .downRightBack)
    assert(cube.corners[.downLeftFront].solvedPosition == .downLeftFront)
    assert(cube.corners[.downLeftBack].solvedPosition == .downLeftBack)
    
//    let perm = [ cube.corners[.upLeftFront].solvedPosition, cube.corners[.downRightFront].solvedPosition, cube.corners[.downLeftBack].solvedPosition ]
//    if perm == [ .upLeftFront, .downRightFront, .downLeftBack ] { return 0 }
//    else if perm == [ .upLeftFront, .downLeftBack, .downRightFront ] { return 1 }
//    else if perm == [ .downRightFront, .upLeftFront, .downLeftBack ] { return 2 }
//    else if perm == [ .downRightFront, .downLeftBack, .upLeftFront ] { return 3 }
//    else if perm == [ .downLeftBack, .upLeftFront, .downRightFront ] { return 4 }
//    else if perm == [ .downLeftBack, .downRightFront, .upLeftFront ] { return 5 }
//    else { fatalError("wtf") }
    let perm = [ cube.corners[.upRightBack].solvedPosition, cube.corners[.upLeftFront].solvedPosition, cube.corners[.downRightFront].solvedPosition ]
    if perm == [ .upRightBack, .upLeftFront, .downRightFront ] { return 0 }
    else if perm == [ .upRightBack, .downRightFront, .upLeftFront ] { return 1 }
    else if perm == [ .upLeftFront, .upRightBack, .downRightFront ] { return 2 }
    else if perm == [ .upLeftFront, .downRightFront, .upRightBack ] { return 3 }
    else if perm == [ .downRightFront, .upRightBack, .upLeftFront ] { return 4 }
    else if perm == [ .downRightFront, .upLeftFront, .upRightBack ] { return 5 }
    else { fatalError("wtf") }
}

@usableFromInline
internal func generateThistlethwaiteThreeTable() -> [Int: Algorithm] {
    return thistlethwaiteTraversal(
        factor: thistlethwaiteThreeLimit,
        allowedTurns: thistlethwaiteThreeAllowedTurns,
        stateEncoding: encodeThistlethwaiteThree
    )
}
