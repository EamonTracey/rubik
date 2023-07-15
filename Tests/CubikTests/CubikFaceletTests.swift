import XCTest

@testable import Cubik

class CubikFaceletTests: XCTestCase {
    func testQuarterTurnFacelets() {
        // Solved.
        var cube = Cube(facelets: [
            .up, .up, .up, .up, .up, .up, .up, .up, .up,
            .down, .down, .down, .down, .down, .down, .down, .down, .down,
            .right, .right, .right, .right, .right, .right, .right, .right, .right,
            .left, .left, .left, .left, .left, .left, .left, .left, .left,
            .front, .front, .front, .front, .front, .front, .front, .front, .front,
            .back, .back, .back, .back, .back, .back, .back, .back, .back
        ])!
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
        ])!
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
        ])!
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
        ])!
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
        ])!
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
        ])!
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
        ])!
        XCTAssert(cube.isValid)
        cube.turn(.back(.counterclockwise))
        XCTAssertEqual(cube, .solvedCube)
    }
}
