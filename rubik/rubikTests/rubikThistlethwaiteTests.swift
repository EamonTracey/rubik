import Foundation
import XCTest

@testable import rubik

final class rubikThistlethwaiteTests: XCTestCase {
    func testStepOne() {
        var cube = Cube.solvedCube
        let scramble = Algorithm("F' D' U' R2 L' U2 R L F R' U2 L' U2 F2 B R2 F2 B' L2 R2 B2 U' R D' R2")!
        cube.execute(scramble)
        
        let stepOneAlgorithm = Thistlethwaite.StepOne.table[cube.edgeOrientation]
        print(stepOneAlgorithm?.reversed.rawValue ?? "Error!")
    }
}
