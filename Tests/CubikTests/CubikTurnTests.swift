import XCTest

@testable import Cubik

final class CubikTurnTests: XCTestCase {
    var cube1: Cube!
    var cube2: Cube!
    
    func testTurnUp() {
        // U4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUpClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnUpClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnUpClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnUpClockwise()
        XCTAssertEqual(cube1, cube2)
        
        // U2 U2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUpHalf()
        cube1.turnUpHalf()
        XCTAssertEqual(cube1, cube2)
        
        // U U = U2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUpClockwise()
        cube1.turnUpClockwise()
        cube2.turnUpHalf()
        XCTAssertEqual(cube1, cube2)
        
        // U' U' = U2
        cube1.turnUpCounterclockwise()
        cube1.turnUpCounterclockwise()
        cube2.turnUpHalf()
        XCTAssertEqual(cube1, cube2)
        
        // U U U = U'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUpClockwise()
        cube1.turnUpClockwise()
        cube1.turnUpClockwise()
        cube2.turnUpCounterclockwise()
        XCTAssertEqual(cube1, cube2)
        
        // U' U' U' = U
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUpCounterclockwise()
        cube1.turnUpCounterclockwise()
        cube1.turnUpCounterclockwise()
        cube2.turnUpClockwise()
        XCTAssertEqual(cube1, cube2)
        
        // U U2 = U'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUpClockwise()
        cube1.turnUpHalf()
        cube2.turnUpCounterclockwise()
        XCTAssertEqual(cube1, cube2)
        
        // U' U2 = U
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnUpCounterclockwise()
        cube1.turnUpHalf()
        cube2.turnUpClockwise()
        XCTAssertEqual(cube1, cube2)
    }
    
    func testTurnDown() {
        // D4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDownClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnDownClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnDownClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnDownClockwise()
        XCTAssertEqual(cube1, cube2)

        // D2 D2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDownHalf()
        cube1.turnDownHalf()
        XCTAssertEqual(cube1, cube2)

        // D D = D2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDownClockwise()
        cube1.turnDownClockwise()
        cube2.turnDownHalf()
        XCTAssertEqual(cube1, cube2)

        // D' D' = D2
        cube1.turnDownCounterclockwise()
        cube1.turnDownCounterclockwise()
        cube2.turnDownHalf()
        XCTAssertEqual(cube1, cube2)

        // D D D = D'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDownClockwise()
        cube1.turnDownClockwise()
        cube1.turnDownClockwise()
        cube2.turnDownCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // D' D' D' = D
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDownCounterclockwise()
        cube1.turnDownCounterclockwise()
        cube1.turnDownCounterclockwise()
        cube2.turnDownClockwise()
        XCTAssertEqual(cube1, cube2)

        // D D2 = D'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDownClockwise()
        cube1.turnDownHalf()
        cube2.turnDownCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // D' D2 = D
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnDownCounterclockwise()
        cube1.turnDownHalf()
        cube2.turnDownClockwise()
        XCTAssertEqual(cube1, cube2)
    }
    
    func testTurnRight() {
        // R4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRightClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnRightClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnRightClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnRightClockwise()
        XCTAssertEqual(cube1, cube2)

        // R2 R2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRightHalf()
        cube1.turnRightHalf()
        XCTAssertEqual(cube1, cube2)

        // R R = R2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRightClockwise()
        cube1.turnRightClockwise()
        cube2.turnRightHalf()
        XCTAssertEqual(cube1, cube2)

        // R' R' = R2
        cube1.turnRightCounterclockwise()
        cube1.turnRightCounterclockwise()
        cube2.turnRightHalf()
        XCTAssertEqual(cube1, cube2)

        // R R R = R'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRightClockwise()
        cube1.turnRightClockwise()
        cube1.turnRightClockwise()
        cube2.turnRightCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // R' R' R' = R
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRightCounterclockwise()
        cube1.turnRightCounterclockwise()
        cube1.turnRightCounterclockwise()
        cube2.turnRightClockwise()
        XCTAssertEqual(cube1, cube2)

        // R R2 = R'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRightClockwise()
        cube1.turnRightHalf()
        cube2.turnRightCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // R' R2 = R
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnRightCounterclockwise()
        cube1.turnRightHalf()
        cube2.turnRightClockwise()
        XCTAssertEqual(cube1, cube2)
    }

    func testTurnLeft() {
        // L4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeftClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnLeftClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnLeftClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnLeftClockwise()
        XCTAssertEqual(cube1, cube2)

        // L2 L2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeftHalf()
        cube1.turnLeftHalf()
        XCTAssertEqual(cube1, cube2)

        // L L = L2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeftClockwise()
        cube1.turnLeftClockwise()
        cube2.turnLeftHalf()
        XCTAssertEqual(cube1, cube2)

        // L' L' = L2
        cube1.turnLeftCounterclockwise()
        cube1.turnLeftCounterclockwise()
        cube2.turnLeftHalf()
        XCTAssertEqual(cube1, cube2)

        // L L L = L'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeftClockwise()
        cube1.turnLeftClockwise()
        cube1.turnLeftClockwise()
        cube2.turnLeftCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // L' L' L' = L
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeftCounterclockwise()
        cube1.turnLeftCounterclockwise()
        cube1.turnLeftCounterclockwise()
        cube2.turnLeftClockwise()
        XCTAssertEqual(cube1, cube2)

        // L L2 = L'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeftClockwise()
        cube1.turnLeftHalf()
        cube2.turnLeftCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // L' L2 = L
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnLeftCounterclockwise()
        cube1.turnLeftHalf()
        cube2.turnLeftClockwise()
        XCTAssertEqual(cube1, cube2)
    }

    func testTurnFront() {
        // F4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFrontClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnFrontClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnFrontClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnFrontClockwise()
        XCTAssertEqual(cube1, cube2)

        // F2 F2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFrontHalf()
        cube1.turnFrontHalf()
        XCTAssertEqual(cube1, cube2)

        // F F = F2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFrontClockwise()
        cube1.turnFrontClockwise()
        cube2.turnFrontHalf()
        XCTAssertEqual(cube1, cube2)

        // F' F' = F2
        cube1.turnFrontCounterclockwise()
        cube1.turnFrontCounterclockwise()
        cube2.turnFrontHalf()
        XCTAssertEqual(cube1, cube2)

        // F F F = F'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFrontClockwise()
        cube1.turnFrontClockwise()
        cube1.turnFrontClockwise()
        cube2.turnFrontCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // F' F' F' = F
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFrontCounterclockwise()
        cube1.turnFrontCounterclockwise()
        cube1.turnFrontCounterclockwise()
        cube2.turnFrontClockwise()
        XCTAssertEqual(cube1, cube2)

        // F F2 = F'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFrontClockwise()
        cube1.turnFrontHalf()
        cube2.turnFrontCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // F' F2 = F
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnFrontCounterclockwise()
        cube1.turnFrontHalf()
        cube2.turnFrontClockwise()
        XCTAssertEqual(cube1, cube2)
    }

    func testTurnBack() {
        // B4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBackClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnBackClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnBackClockwise()
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnBackClockwise()
        XCTAssertEqual(cube1, cube2)

        // B2 B2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBackHalf()
        cube1.turnBackHalf()
        XCTAssertEqual(cube1, cube2)

        // B B = B2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBackClockwise()
        cube1.turnBackClockwise()
        cube2.turnBackHalf()
        XCTAssertEqual(cube1, cube2)

        // B' B' = B2
        cube1.turnBackCounterclockwise()
        cube1.turnBackCounterclockwise()
        cube2.turnBackHalf()
        XCTAssertEqual(cube1, cube2)

        // B B B = B'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBackClockwise()
        cube1.turnBackClockwise()
        cube1.turnBackClockwise()
        cube2.turnBackCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // B' B' B' = B
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBackCounterclockwise()
        cube1.turnBackCounterclockwise()
        cube1.turnBackCounterclockwise()
        cube2.turnBackClockwise()
        XCTAssertEqual(cube1, cube2)

        // B B2 = B'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBackClockwise()
        cube1.turnBackHalf()
        cube2.turnBackCounterclockwise()
        XCTAssertEqual(cube1, cube2)

        // B' B2 = B
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnBackCounterclockwise()
        cube1.turnBackHalf()
        cube2.turnBackClockwise()
        XCTAssertEqual(cube1, cube2)
    }

    func testStanding() {
        // S4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnStanding(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnStanding(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnStanding(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnStanding(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // S2 S2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnStanding(.half)
        cube1.turnStanding(.half)
        XCTAssertEqual(cube1, cube2)

        // S S = S2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnStanding(.clockwise)
        cube1.turnStanding(.clockwise)
        cube2.turnStanding(.half)
        XCTAssertEqual(cube1, cube2)

        // S' S' = S2
        cube1.turnStanding(.counterclockwise)
        cube1.turnStanding(.counterclockwise)
        cube2.turnStanding(.half)
        XCTAssertEqual(cube1, cube2)

        // S S S = S'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnStanding(.clockwise)
        cube1.turnStanding(.clockwise)
        cube1.turnStanding(.clockwise)
        cube2.turnStanding(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // S' S' S' = S
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnStanding(.counterclockwise)
        cube1.turnStanding(.counterclockwise)
        cube1.turnStanding(.counterclockwise)
        cube2.turnStanding(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // S S2 = S'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnStanding(.clockwise)
        cube1.turnStanding(.half)
        cube2.turnStanding(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // S' S2 = S
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnStanding(.counterclockwise)
        cube1.turnStanding(.half)
        cube2.turnStanding(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }

    func testMiddle() {
        // M4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnMiddle(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnMiddle(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnMiddle(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnMiddle(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // M2 M2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnMiddle(.half)
        cube1.turnMiddle(.half)
        XCTAssertEqual(cube1, cube2)

        // M M = M2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnMiddle(.clockwise)
        cube1.turnMiddle(.clockwise)
        cube2.turnMiddle(.half)
        XCTAssertEqual(cube1, cube2)

        // M' M' = M2
        cube1.turnMiddle(.counterclockwise)
        cube1.turnMiddle(.counterclockwise)
        cube2.turnMiddle(.half)
        XCTAssertEqual(cube1, cube2)

        // M M M = M'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnMiddle(.clockwise)
        cube1.turnMiddle(.clockwise)
        cube1.turnMiddle(.clockwise)
        cube2.turnMiddle(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // M' M' M' = M
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnMiddle(.counterclockwise)
        cube1.turnMiddle(.counterclockwise)
        cube1.turnMiddle(.counterclockwise)
        cube2.turnMiddle(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // M M2 = M'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnMiddle(.clockwise)
        cube1.turnMiddle(.half)
        cube2.turnMiddle(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // M' M2 = M
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnMiddle(.counterclockwise)
        cube1.turnMiddle(.half)
        cube2.turnMiddle(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }

    func testEquator() {
        // E4 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnEquator(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnEquator(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnEquator(.clockwise)
        XCTAssertNotEqual(cube1, cube2)
        cube1.turnEquator(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // E2 E2 =
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnEquator(.half)
        cube1.turnEquator(.half)
        XCTAssertEqual(cube1, cube2)

        // E E = E2
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnEquator(.clockwise)
        cube1.turnEquator(.clockwise)
        cube2.turnEquator(.half)
        XCTAssertEqual(cube1, cube2)

        // E' E' = E2
        cube1.turnEquator(.counterclockwise)
        cube1.turnEquator(.counterclockwise)
        cube2.turnEquator(.half)
        XCTAssertEqual(cube1, cube2)

        // E E E = E'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnEquator(.clockwise)
        cube1.turnEquator(.clockwise)
        cube1.turnEquator(.clockwise)
        cube2.turnEquator(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // E' E' E' = E
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnEquator(.counterclockwise)
        cube1.turnEquator(.counterclockwise)
        cube1.turnEquator(.counterclockwise)
        cube2.turnEquator(.clockwise)
        XCTAssertEqual(cube1, cube2)

        // E E2 = E'
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnEquator(.clockwise)
        cube1.turnEquator(.half)
        cube2.turnEquator(.counterclockwise)
        XCTAssertEqual(cube1, cube2)

        // E' E2 = E
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.turnEquator(.counterclockwise)
        cube1.turnEquator(.half)
        cube2.turnEquator(.clockwise)
        XCTAssertEqual(cube1, cube2)
    }
}
