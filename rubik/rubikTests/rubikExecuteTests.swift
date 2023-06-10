import XCTest

@testable import rubik

class rubikExecuteTests: XCTestCase {
    var cube1: Cube!
    var cube2: Cube!
    
    func testSune() {
        cube1 = .solvedCube
        cube2 = .solvedCube
        
        let sune = Algorithm("R U R' U R U2 R'")!
        let antisune = Algorithm("R U2 R' U' R U' R'")!
        cube1.execute(algorithm: sune)
        XCTAssertNotEqual(cube1, cube2)
        cube1.execute(algorithm: antisune)
        XCTAssertEqual(cube1, cube2)
    }
    
    func testJperms() {
        cube1 = .solvedCube
        cube2 = .solvedCube
        
        let jperm1 = Algorithm("R U R' F' R U R' U' R' F R2 U' R' U'")!
        let jperm2 = Algorithm("R U2 R' U' R U2 L' U R' U' L")!
        cube1.execute(algorithm: jperm1)
        XCTAssertNotEqual(cube1, cube2)
        cube1.execute(algorithm: jperm2)
        XCTAssertEqual(cube1, cube2)
    }
}
