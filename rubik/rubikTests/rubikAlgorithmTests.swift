import XCTest

@testable import rubik

final class rubikAlgorithmTests: XCTestCase {
    var algorithm: Algorithm!
    
    func testValidStringInitialization() {
        algorithm = Algorithm("")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [])
        XCTAssertEqual(algorithm.length, 0)
        
        algorithm = Algorithm("   ")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [])
        XCTAssertEqual(algorithm.length, 0)
        
        algorithm = Algorithm("U")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [.up(.clockwise)])
        XCTAssertEqual(algorithm.length, 1)
        
        algorithm = Algorithm("U D R L F B")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [.up(.clockwise), .down(.clockwise), .right(.clockwise), .left(.clockwise), .front(.clockwise), .back(.clockwise)])
        XCTAssertEqual(algorithm.length, 6)
        
        algorithm = Algorithm("U' D' R' L' F' B'")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [.up(.counterclockwise), .down(.counterclockwise), .right(.counterclockwise), .left(.counterclockwise), .front(.counterclockwise), .back(.counterclockwise)])
        XCTAssertEqual(algorithm.length, 6)
        
        algorithm = Algorithm("U2 D2 R2 L2 F2 B2")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [.up(.half), .down(.half), .right(.half), .left(.half), .front(.half), .back(.half)])
        XCTAssertEqual(algorithm.length, 6)
        
        algorithm = Algorithm("R U R' U' R' F R2 U' R' U' R U R' F'")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [.right(.clockwise), .up(.clockwise), .right(.counterclockwise), .up(.counterclockwise), .right(.counterclockwise), .front(.clockwise), .right(.half), .up(.counterclockwise), .right(.counterclockwise), .up(.counterclockwise), .right(.clockwise), .up(.clockwise), .right(.counterclockwise), .front(.counterclockwise)])
        XCTAssertEqual(algorithm.length, 14)
        
        algorithm = Algorithm("    U D  R L        F   B      ")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.turns, [.up(.clockwise), .down(.clockwise), .right(.clockwise), .left(.clockwise), .front(.clockwise), .back(.clockwise)])
        XCTAssertEqual(algorithm.length, 6)
    }
    
    func testInvalidStringInitialization() {
        algorithm = Algorithm("Q")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("Q'")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("Q2")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("U 2")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("U '")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("U Q")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("U D Q Q F B")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("U\nD\nR\nL\nF\nB")
        XCTAssertNil(algorithm)
    }
}
