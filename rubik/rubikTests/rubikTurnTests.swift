import XCTest

@testable import rubik

final class rubikTurnTests: XCTestCase {
    func testTurnUp() {
        var cube1: Cube
        var cube2: Cube
        
        // U4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnUp(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnUp(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnUp(.clockwise)
        XCTAssertEqual(cube1, cube2)
        
        // U2 U2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.half)
        cube1.turnUp(.half)
        XCTAssertEqual(cube1, cube2)
        
        // U U = U2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.clockwise)
        cube1.turnUp(.clockwise)
        cube2.turnUp(.half)
        XCTAssertEqual(cube1, cube2)
        
        // U' U' = U2
        cube1.turnUp(.counterclockwise)
        cube1.turnUp(.counterclockwise)
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
        
        // U' U' U' = U
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.counterclockwise)
        cube1.turnUp(.counterclockwise)
        cube1.turnUp(.counterclockwise)
        cube2.turnUp(.clockwise)
        XCTAssertEqual(cube1, cube2)
        
        // U U2 = U'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.clockwise)
        cube1.turnUp(.half)
        cube2.turnUp(.counterclockwise)
        XCTAssertEqual(cube1, cube2)
        
        // U' U2 = U
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUp(.counterclockwise)
        cube1.turnUp(.half)
        cube2.turnUp(.counterclockwise)
        XCTAssertEqual(cube1, cube2)
    }
}
