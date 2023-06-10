import XCTest

@testable import rubik

final class rubikReverseTests: XCTestCase {
    var algorithm1: Algorithm!
    var algorithm2: Algorithm!
    
    func testTurnQuarterReverse() {
        XCTAssertEqual(Turn.up(.clockwise).reversed, Turn.up(.counterclockwise))
        XCTAssertEqual(Turn.up(.counterclockwise).reversed, Turn.up(.clockwise))
        XCTAssertEqual(Turn.down(.clockwise).reversed, Turn.down(.counterclockwise))
        XCTAssertEqual(Turn.down(.counterclockwise).reversed, Turn.down(.clockwise))
        XCTAssertEqual(Turn.right(.clockwise).reversed, Turn.right(.counterclockwise))
        XCTAssertEqual(Turn.right(.counterclockwise).reversed, Turn.right(.clockwise))
        XCTAssertEqual(Turn.left(.clockwise).reversed, Turn.left(.counterclockwise))
        XCTAssertEqual(Turn.left(.counterclockwise).reversed, Turn.left(.clockwise))
        XCTAssertEqual(Turn.front(.clockwise).reversed, Turn.front(.counterclockwise))
        XCTAssertEqual(Turn.front(.counterclockwise).reversed, Turn.front(.clockwise))
        XCTAssertEqual(Turn.back(.clockwise).reversed, Turn.back(.counterclockwise))
        XCTAssertEqual(Turn.back(.counterclockwise).reversed, Turn.back(.clockwise))
    }
    
    func testTurnHalfReverse() {
        XCTAssertEqual(Turn.up(.half).reversed, Turn.up(.half))
        XCTAssertEqual(Turn.down(.half).reversed, Turn.down(.half))
        XCTAssertEqual(Turn.right(.half).reversed, Turn.right(.half))
        XCTAssertEqual(Turn.left(.half).reversed, Turn.left(.half))
        XCTAssertEqual(Turn.front(.half).reversed, Turn.front(.half))
        XCTAssertEqual(Turn.back(.half).reversed, Turn.back(.half))
    }
    
    func testAlgorithmReverse() {
        algorithm1 = Algorithm("U D R L F B")!
        algorithm2 = Algorithm("B' F' L' R' D' U'")!
        XCTAssertEqual(algorithm1.reversed, algorithm2)
        
        algorithm1 = Algorithm("B' F' L' R' D' U'")!
        algorithm2 = Algorithm("U D R L F B")!
        XCTAssertEqual(algorithm1.reversed, algorithm2)
        
        algorithm1 = Algorithm("U2 D2 R2 L2 F2 B2")!
        algorithm2 = Algorithm("B2 F2 L2 R2 D2 U2")!
        XCTAssertEqual(algorithm1.reversed, algorithm2)
        
        algorithm1 = Algorithm("R U R' U' R' F R2 U R' U' F'")!
        algorithm2 = Algorithm("F U R U' R2 F' R U R U' R'")!
        XCTAssertEqual(algorithm1.reversed, algorithm2)
    }
}
