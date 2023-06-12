import Foundation
import XCTest

@testable import rubik

final class rubikThistlethwaiteTests: XCTestCase {
    func testStepOne() {
        var cube = Cube.solvedCube
        let scramble = Algorithm("R' D' R B' D2 R L' F B2 R2 B' F2 L U R' B L' F R D' R' F L' F2 L")!
        cube.execute(scramble)
        
        let stepOneAlgorithm = Thistlethwaite.StepOne.table[cube.edgeOrientation]!.reversed
        cube.execute(stepOneAlgorithm)
        
        XCTAssertEqual(Thistlethwaite.StepTwo.table.count, 1082565)
        
        let stepTwoAlgorithm = Thistlethwaite.StepTwo.table[
            cube.cornerOrientation.map { $0.rawValue } + [
                UInt8(cube.edgePermutation.firstIndex(of: .rightFront)!),
                UInt8(cube.edgePermutation.firstIndex(of: .leftFront)!),
                UInt8(cube.edgePermutation.firstIndex(of: .rightBack)!),
                UInt8(cube.edgePermutation.firstIndex(of: .leftBack)!),
            ].sorted()
        ]!.reversed
        
        let finalAlgorithm = stepOneAlgorithm.appending(contentsOf: stepTwoAlgorithm)
        print(finalAlgorithm.rawValue)
    }
}
