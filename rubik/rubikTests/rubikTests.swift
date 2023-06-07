import XCTest

@testable import rubik

final class rubikTests: XCTestCase {
    func testSolvedConstants() {
        let explicitSolvedEdges = [
            Edge(solvedPosition: .upRight, orientation: .correct),
            Edge(solvedPosition: .upLeft, orientation: .correct),
            Edge(solvedPosition: .upFront, orientation: .correct),
            Edge(solvedPosition: .upBack, orientation: .correct),
            Edge(solvedPosition: .downRight, orientation: .correct),
            Edge(solvedPosition: .downLeft, orientation: .correct),
            Edge(solvedPosition: .downFront, orientation: .correct),
            Edge(solvedPosition: .downBack, orientation: .correct),
            Edge(solvedPosition: .rightFront, orientation: .correct),
            Edge(solvedPosition: .rightBack, orientation: .correct),
            Edge(solvedPosition: .leftFront, orientation: .correct),
            Edge(solvedPosition: .leftBack, orientation: .correct),
        ]
        XCTAssertEqual(explicitSolvedEdges, Cube.solvedEdges)
        
        let explicitCornersSolved = [
            Corner(solvedPosition: .upRightFront, orientation: .correct),
            Corner(solvedPosition: .upRightBack, orientation: .correct),
            Corner(solvedPosition: .upLeftFront, orientation: .correct),
            Corner(solvedPosition: .upLeftBack, orientation: .correct),
            Corner(solvedPosition: .downRightFront, orientation: .correct),
            Corner(solvedPosition: .downRightBack, orientation: .correct),
            Corner(solvedPosition: .downLeftFront, orientation: .correct),
            Corner(solvedPosition: .downLeftBack, orientation: .correct)
        ]
        XCTAssertEqual(explicitCornersSolved, Cube.solvedCorners)
    }
    
    // TODO: Implement
    func testAreEdgesOrientable() {
        XCTAssertTrue(true)
    }
    
    // TODO: Implement
    func testAreCornersOrientable() {
        XCTAssertTrue(true)
    }
    
    // TODO: Implement
    func testIsPermutable() {
        XCTAssertTrue(true)
    }
    
    func testTurnUp() {
        var cube1: Cube = .solvedCube
        var cube2: Cube = .solvedCube
        
        // U4 =
        cube1.turnUp(.clockwise)
        XCTAssertNotEqual(cube1, Cube.solvedCube)
        cube1.turnUp(.clockwise)
        XCTAssertNotEqual(cube1, Cube.solvedCube)
        cube1.turnUp(.clockwise)
        XCTAssertNotEqual(cube1, Cube.solvedCube)
        cube1.turnUp(.clockwise)
        XCTAssertEqual(cube1, cube2)
        
        // U2 U2 =
        cube1.turnUp(.half)
        cube1.turnUp(.half)
        XCTAssertEqual(cube1, cube2)
        
        // U U = U2
        cube1.turnUp(.clockwise)
        cube1.turnUp(.clockwise)
        cube2.turnUp(.half)
        XCTAssertEqual(cube1, cube2)
        
        // U U U = U'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.clockwise)
        cube1.turnUp(.clockwise)
        cube1.turnUp(.clockwise)
        cube2.turnUp(.counterclockwise)
        XCTAssertEqual(cube1, cube2)
        
        // U U2 = U'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.clockwise)
        cube1.turnUp(.half)
        cube2.turnUp(.counterclockwise)
        XCTAssertEqual(cube1, cube2)
    }
}
