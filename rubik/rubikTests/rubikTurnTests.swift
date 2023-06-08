import XCTest

@testable import rubik

final class rubikTurnTests: XCTestCase {
    var cube1: Cube!
    var cube2: Cube!
    
    func testTurnUp() {
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
        cube2.turnUp(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }
    
    func testTurnDown() {
        // D4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDown(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnDown(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnDown(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnDown(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // D2 D2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDown(.half)
        cube1.turnDown(.half)
        XCTAssertEqual(cube1, cube2)

        // D D = D2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDown(.clockwise)
        cube1.turnDown(.clockwise)
        cube2.turnDown(.half)
        XCTAssertEqual(cube1, cube2)

        // D' D' = D2
        cube1.turnDown(.counterclockwise)
        cube1.turnDown(.counterclockwise)
        cube2.turnDown(.half)
        XCTAssertEqual(cube1, cube2)

        // D D D = D'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDown(.clockwise)
        cube1.turnDown(.clockwise)
        cube1.turnDown(.clockwise)
        cube2.turnDown(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // D' D' D' = D
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDown(.counterclockwise)
        cube1.turnDown(.counterclockwise)
        cube1.turnDown(.counterclockwise)
        cube2.turnDown(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // D D2 = D'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDown(.clockwise)
        cube1.turnDown(.half)
        cube2.turnDown(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // D' D2 = D
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDown(.counterclockwise)
        cube1.turnDown(.half)
        cube2.turnDown(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }
    
    func testTurnRight() {
        // R4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRight(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnRight(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnRight(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnRight(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // R2 R2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRight(.half)
        cube1.turnRight(.half)
        XCTAssertEqual(cube1, cube2)

        // R R = R2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRight(.clockwise)
        cube1.turnRight(.clockwise)
        cube2.turnRight(.half)
        XCTAssertEqual(cube1, cube2)

        // R' R' = R2
        cube1.turnRight(.counterclockwise)
        cube1.turnRight(.counterclockwise)
        cube2.turnRight(.half)
        XCTAssertEqual(cube1, cube2)

        // R R R = R'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRight(.clockwise)
        cube1.turnRight(.clockwise)
        cube1.turnRight(.clockwise)
        cube2.turnRight(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // R' R' R' = R
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRight(.counterclockwise)
        cube1.turnRight(.counterclockwise)
        cube1.turnRight(.counterclockwise)
        cube2.turnRight(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // R R2 = R'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRight(.clockwise)
        cube1.turnRight(.half)
        cube2.turnRight(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // R' R2 = R
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRight(.counterclockwise)
        cube1.turnRight(.half)
        cube2.turnRight(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }
    
    func testTurnLeft() {
        // L4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeft(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnLeft(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnLeft(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnLeft(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // L2 L2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeft(.half)
        cube1.turnLeft(.half)
        XCTAssertEqual(cube1, cube2)

        // L L = L2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeft(.clockwise)
        cube1.turnLeft(.clockwise)
        cube2.turnLeft(.half)
        XCTAssertEqual(cube1, cube2)

        // L' L' = L2
        cube1.turnLeft(.counterclockwise)
        cube1.turnLeft(.counterclockwise)
        cube2.turnLeft(.half)
        XCTAssertEqual(cube1, cube2)

        // L L L = L'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeft(.clockwise)
        cube1.turnLeft(.clockwise)
        cube1.turnLeft(.clockwise)
        cube2.turnLeft(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // L' L' L' = L
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeft(.counterclockwise)
        cube1.turnLeft(.counterclockwise)
        cube1.turnLeft(.counterclockwise)
        cube2.turnLeft(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // L L2 = L'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeft(.clockwise)
        cube1.turnLeft(.half)
        cube2.turnLeft(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // L' L2 = L
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeft(.counterclockwise)
        cube1.turnLeft(.half)
        cube2.turnLeft(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }

    func testTurnFront() {
        // F4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFront(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnFront(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnFront(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnFront(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // F2 F2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFront(.half)
        cube1.turnFront(.half)
        XCTAssertEqual(cube1, cube2)

        // F F = F2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFront(.clockwise)
        cube1.turnFront(.clockwise)
        cube2.turnFront(.half)
        XCTAssertEqual(cube1, cube2)

        // F' F' = F2
        cube1.turnFront(.counterclockwise)
        cube1.turnFront(.counterclockwise)
        cube2.turnFront(.half)
        XCTAssertEqual(cube1, cube2)

        // F F F = F'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFront(.clockwise)
        cube1.turnFront(.clockwise)
        cube1.turnFront(.clockwise)
        cube2.turnFront(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // F' F' F' = F
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFront(.counterclockwise)
        cube1.turnFront(.counterclockwise)
        cube1.turnFront(.counterclockwise)
        cube2.turnFront(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // F F2 = F'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFront(.clockwise)
        cube1.turnFront(.half)
        cube2.turnFront(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // F' F2 = F
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFront(.counterclockwise)
        cube1.turnFront(.half)
        cube2.turnFront(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }

    func testTurnBack() {
        // B4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBack(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnBack(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnBack(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnBack(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // B2 B2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBack(.half)
        cube1.turnBack(.half)
        XCTAssertEqual(cube1, cube2)

        // B B = B2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBack(.clockwise)
        cube1.turnBack(.clockwise)
        cube2.turnBack(.half)
        XCTAssertEqual(cube1, cube2)

        // B' B' = B2
        cube1.turnBack(.counterclockwise)
        cube1.turnBack(.counterclockwise)
        cube2.turnBack(.half)
        XCTAssertEqual(cube1, cube2)

        // B B B = B'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBack(.clockwise)
        cube1.turnBack(.clockwise)
        cube1.turnBack(.clockwise)
        cube2.turnBack(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // B' B' B' = B
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBack(.counterclockwise)
        cube1.turnBack(.counterclockwise)
        cube1.turnBack(.counterclockwise)
        cube2.turnBack(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // B B2 = B'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBack(.clockwise)
        cube1.turnBack(.half)
        cube2.turnBack(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // B' B2 = B
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBack(.counterclockwise)
        cube1.turnBack(.half)
        cube2.turnBack(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }
}
