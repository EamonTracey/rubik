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
}
