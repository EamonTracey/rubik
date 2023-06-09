import XCTest

@testable import rubik

class rubikAlgorithmTests: XCTestCase {
    var algorithm: Algorithm!
    
    func testValidStringInitialization() {
        algorithm = Algorithm("")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.length, 0)
        
        algorithm = Algorithm("   ")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.length, 0)
        
        algorithm = Algorithm("U")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.length, 1)
        
        algorithm = Algorithm("U D R L F B")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.length, 6)
        
        algorithm = Algorithm("U' D' R' L' F' B'")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.length, 6)
        
        algorithm = Algorithm("U2 D2 R2 L2 F2 B2")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.length, 6)
        
        algorithm = Algorithm("R U R' U' R' F R2 U' R' U' R U R' F'")
        XCTAssertNotNil(algorithm)
        XCTAssertEqual(algorithm.length, 14)
        
        algorithm = Algorithm("    U D  R L        F   B      ")
        XCTAssertNotNil(algorithm)
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
        
        algorithm = Algorithm("U Q")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("U D Q Q F B")
        XCTAssertNil(algorithm)
        
        algorithm = Algorithm("U\nD\nR\nL\nF\nB")
        XCTAssertNil(algorithm)
    }
}
