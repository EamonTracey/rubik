import XCTest

@testable import Cubik

class CubikFaceletTests: XCTestCase {
    var cube: Cube!

    func testQuarterTurnFacelets() {
        // Solved.
        cube = Cube(facelets: [
            .up, .up, .up, .up, .up, .up, .up, .up, .up,
            .down, .down, .down, .down, .down, .down, .down, .down, .down,
            .right, .right, .right, .right, .right, .right, .right, .right, .right,
            .left, .left, .left, .left, .left, .left, .left, .left, .left,
            .front, .front, .front, .front, .front, .front, .front, .front, .front,
            .back, .back, .back, .back, .back, .back, .back, .back, .back
        ])
        XCTAssert(cube.isValid)
        XCTAssertEqual(cube, .solvedCube)

        // U
        cube = Cube(facelets: [
            .up, .up, .up, .up, .up, .up, .up, .up, .up,
            .down, .down, .down, .down, .down, .down, .down, .down, .down,
            .back, .back, .back, .right, .right, .right, .right, .right, .right,
            .front, .front, .front, .left, .left, .left, .left, .left, .left,
            .right, .right, .right, .front, .front, .front, .front, .front, .front,
            .left, .left, .left, .back, .back, .back, .back, .back, .back
        ])
        XCTAssert(cube.isValid)
        cube.turn(.up(.counterclockwise))
        XCTAssertEqual(cube, .solvedCube)

        // D
        cube = Cube(facelets: [
            .up, .up, .up, .up, .up, .up, .up, .up, .up,
            .down, .down, .down, .down, .down, .down, .down, .down, .down,
            .right, .right, .right, .right, .right, .right, .front, .front, .front,
            .left, .left, .left, .left, .left, .left, .back, .back, .back,
            .front, .front, .front, .front, .front, .front, .left, .left, .left,
            .back, .back, .back, .back, .back, .back, .right, .right, .right
        ])
        XCTAssert(cube.isValid)
        cube.turn(.down(.counterclockwise))
        XCTAssertEqual(cube, .solvedCube)

        // R
        cube = Cube(facelets: [
            .up, .up, .front, .up, .up, .front, .up, .up, .front,
            .down, .down, .back, .down, .down, .back, .down, .down, .back,
            .right, .right, .right, .right, .right, .right, .right, .right, .right,
            .left, .left, .left, .left, .left, .left, .left, .left, .left,
            .front, .front, .down, .front, .front, .down, .front, .front, .down,
            .up, .back, .back, .up, .back, .back, .up, .back, .back
        ])
        XCTAssert(cube.isValid)
        cube.turn(.right(.counterclockwise))
        XCTAssertEqual(cube, .solvedCube)

        // L
        cube = Cube(facelets: [
            .back, .up, .up, .back, .up, .up, .back, .up, .up,
            .front, .down, .down, .front, .down, .down, .front, .down, .down,
            .right, .right, .right, .right, .right, .right, .right, .right, .right,
            .left, .left, .left, .left, .left, .left, .left, .left, .left,
            .up, .front, .front, .up, .front, .front, .up, .front, .front,
            .back, .back, .down, .back, .back, .down, .back, .back, .down
        ])
        XCTAssert(cube.isValid)
        cube.turn(.left(.counterclockwise))
        XCTAssertEqual(cube, .solvedCube)

        // F
        cube = Cube(facelets: [
            .up, .up, .up, .up, .up, .up, .left, .left, .left,
            .right, .right, .right, .down, .down, .down, .down, .down, .down,
            .up, .right, .right, .up, .right, .right, .up, .right, .right,
            .left, .left, .down, .left, .left, .down, .left, .left, .down,
            .front, .front, .front, .front, .front, .front, .front, .front, .front,
            .back, .back, .back, .back, .back, .back, .back, .back, .back
        ])
        XCTAssert(cube.isValid)
        cube.turn(.front(.counterclockwise))
        XCTAssertEqual(cube, .solvedCube)

        // B
        cube = Cube(facelets: [
            .right, .right, .right, .up, .up, .up, .up, .up, .up,
            .down, .down, .down, .down, .down, .down, .left, .left, .left,
            .right, .right, .down, .right, .right, .down, .right, .right, .down,
            .up, .left, .left, .up, .left, .left, .up, .left, .left,
            .front, .front, .front, .front, .front, .front, .front, .front, .front,
            .back, .back, .back, .back, .back, .back, .back, .back, .back
        ])
        XCTAssert(cube.isValid)
        cube.turn(.back(.counterclockwise))
        XCTAssertEqual(cube, .solvedCube)
    }

    func testScrambledFacelets() {
        cube = Cube(facelets: [
            .back, .back, .back, .left, .up, .front, .right, .up, .right,
            .front, .down, .up, .down, .down, .right, .left, .front, .down,
            .down, .right, .left, .front, .right, .back, .right, .back, .back,
            .down, .front, .up, .right, .left, .up, .down, .left, .left,
            .front, .left, .front, .right, .front, .down, .up, .back, .back,
            .up, .left, .right, .up, .back, .down, .left, .up, .front
        ])
        XCTAssert(cube.isValid)
        cube.execute(Algorithm("U' L' U' D L R F D' B2 L' R' U F2 L F' B' D U2 L R B2 U B L B'")!)
        XCTAssertEqual(cube, .solvedCube)

        cube = Cube(facelets: [
            .left, .up, .back, .front, .up, .back, .up, .front, .right,
            .left, .front, .down, .down, .down, .right, .front, .left, .up,
            .back, .down, .left, .front, .right, .right, .right, .down, .back,
            .down, .down, .front, .back, .left, .up, .left, .left, .up,
            .right, .up, .down, .left, .front, .left, .front, .right, .front,
            .up, .back, .back, .up, .back, .right, .right, .back, .down
        ])
        XCTAssert(cube.isValid)
        cube.execute(Algorithm("U' R' B' D' F' L2 D R2 U B2 D' R' U' R2 F2 D R2 B2 U2 R2 U' U2 L2 D2 R2 B2 L2 B2 U2 B2 R2")!)
        XCTAssertEqual(cube, .solvedCube)
    }
}
