import XCTest

@testable import rubik

class rubikExecuteTests: XCTestCase {
    var cube1: Cube!
    var cube2: Cube!
    
    func testExecuteRepeats() {
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.execute(Algorithm("U")!, repeats: 4)
        XCTAssertEqual(cube1, cube2)
        
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.execute(Algorithm("R U")!, repeats: 105)
        XCTAssertEqual(cube1, cube2)
        
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.execute(Algorithm("R B L F")!, repeats: 315)
        XCTAssertEqual(cube1, cube2)
        
        cube1 = .solvedCube
        cube2 = .solvedCube
        cube1.execute(Algorithm("R U2 D' B D'")!, repeats: 1260)
        XCTAssertEqual(cube1, cube2)
    }
    
    func testSune() {
        cube1 = .solvedCube
        cube2 = .solvedCube
        
        let sune = Algorithm("R U R' U R U2 R'")!
        let antisune = Algorithm("R U2 R' U' R U' R'")!
        cube1.execute(sune)
        XCTAssertNotEqual(cube1, cube2)
        cube1.execute(antisune)
        XCTAssertEqual(cube1, cube2)
    }
    
    func testJperms() {
        cube1 = .solvedCube
        cube2 = .solvedCube
        
        let jperm1 = Algorithm("R U R' F' R U R' U' R' F R2 U' R' U'")!
        let jperm2 = Algorithm("R U2 R' U' R U2 L' U R' U' L")!
        cube1.execute(jperm1)
        XCTAssertNotEqual(cube1, cube2)
        cube1.execute(jperm2)
        XCTAssertEqual(cube1, cube2)
    }
}
