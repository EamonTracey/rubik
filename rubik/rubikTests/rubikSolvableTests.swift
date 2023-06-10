import XCTest

@testable import rubik

final class rubikSolvableTests: XCTestCase {
    var cube: Cube!
    
    func testAreEdgesOrientableTrue() {
        cube = .solvedCube
        cube.execute(Algorithm("U R2 F B R B2 R U2 L B2 R U' D' R2 F R' L B2 U2 F2")!)
        XCTAssertTrue(cube.areEdgesOrientable)
    }
    
    func testAreEdgesOrientableFalse() {
        cube = .solvedCube
        cube.execute(Algorithm("U R2 F B R B2 R U2 L B2 R U' D' R2 F R' L B2 U2 F2")!)
        cube.edges[.upRight].flip()
        XCTAssertFalse(cube.areEdgesOrientable)
    }
    
    func testAreCornersOrientableTrue() {
        cube = .solvedCube
        cube.execute(Algorithm("R U D' R' F B'")!, repeats: 8)
        XCTAssertTrue(cube.areCornersOrientable)
    }
    
    func testAreCornersOrientableFalse() {
        cube = .solvedCube
        cube.execute(Algorithm("R U D' R' F B'")!, repeats: 8)
        cube.corners[.upRightFront].twist(.clockwise)
        XCTAssertFalse(cube.areCornersOrientable)
        cube.corners[.upRightFront].twist(.clockwise)
        XCTAssertFalse(cube.areCornersOrientable)
    }
    
    func testIsPermutableTrue() {
        cube = .solvedCube
        cube.execute(Algorithm("F U2 L2 B2 F' U L2 U R2 D2 L' B L2 B' R2 U2")!)
        XCTAssertTrue(cube.isPermutable)
    }
    
    func testIsPermutableFalse() {
        let storedUpRight: Edge
        let storedUpRightFront: Corner
        
        cube = .solvedCube
        cube.execute(Algorithm("F U2 L2 B2 F' U L2 U R2 D2 L' B L2 B' R2 U2")!)
        storedUpRight = cube.edges[.upRight]
        cube.edges[.upRight] = cube.edges[.upFront]
        cube.edges[.upFront] = storedUpRight
        XCTAssertFalse(cube.isPermutable)
        
        cube = .solvedCube
        cube.execute(Algorithm("F U2 L2 B2 F' U L2 U R2 D2 L' B L2 B' R2 U2")!)
        storedUpRightFront = cube.corners[.upRightFront]
        cube.corners[.upRightFront] = cube.corners[.upRightBack]
        cube.corners[.upRightBack] = storedUpRightFront
        XCTAssertFalse(cube.isPermutable)
    }
    
    func testIsSolvableTrue() {
        cube = .solvedCube
        cube.execute(Algorithm("U' L' D2 L2 D' B2 R2 U F2 U' F2 B D' R' U' R F' U' F R")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("F L' U' F2 U' B2 L2 B2 U' F2 L2 R D U' B L' F D2 U")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("R2 U' F2 L2 B2 D2 L2 D L2 U' B' L U L2 U2 F R2 D2 B'")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("D2 L2 R2 D' R2 U' L2 B2 F' U' F2 D2 B L' U2 L U' F' R'")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("B R2 U2 B2 F2 R' B2 D2 L' U F' R' U' F D2 B' R' D' R'")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("U' B2 L' U2 F2 R' F2 R F2 L U2 L' U2 D' F U B U' L' D'")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("L' F L D R F B' R U' R2 F2 D2 R' U2 B2 R D2 F2 U2 F'")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("U2 R' U R F' D' R' B D' L' F2 B L2 U2 B U2 R2 U2 B2 D2")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("F D' L2 U F2 D B2 F2 L2 D L D B' F2 L2 U F2 D' F' R'")!)
        XCTAssertTrue(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("F' D' R' B F D2 U2 B U2 B' U2 L U' R' D U' R2 F")!)
        XCTAssertTrue(cube.isSolvable)
    }
    
    // TODO: Implement
    func testIsSolvableFalse() {
        let storedUpRight: Edge
        let storedUpRightFront: Corner
        
        cube = .solvedCube
        cube.execute(Algorithm("L' D2 U2 L2 F2 L' U2 L' U' R U R F2 L' U R' B R' U2")!)
        cube.edges[.upRight].flip()
        XCTAssertFalse(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("L D R U2 F2 U2 L2 U2 F' R2 F2 D2 U B' U2 F2 D F2 U'")!)
        cube.corners[.upRightFront].twist(.clockwise)
        XCTAssertFalse(cube.isSolvable)
        cube.corners[.upRightFront].twist(.clockwise)
        XCTAssertFalse(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("D L' U B2 R B U2 D' L' B2 D R' L2 B2 L' D2 F2 B2")!)
        storedUpRight = cube.edges[.upRight]
        cube.edges[.upRight] = cube.edges[.upFront]
        cube.edges[.upFront] = storedUpRight
        XCTAssertFalse(cube.isSolvable)
        
        cube = .solvedCube
        cube.execute(Algorithm("D F2 R' B' R F' L2 B' U' L' F2 U2 F2 R2 U' D2 R2 D2")!)
        storedUpRightFront = cube.corners[.upRightFront]
        cube.corners[.upRightFront] = cube.corners[.upRightBack]
        cube.corners[.upRightBack] = storedUpRightFront
        XCTAssertFalse(cube.isPermutable)
    }
}
