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
        let stepTwoAlgorithm = Thistlethwaite.StepTwo.table[cube.cornerOrientation]!.reversed
        
        let finalAlgorithm = stepOneAlgorithm.appending(contentsOf: stepTwoAlgorithm)
        print(finalAlgorithm.rawValue)
    }
}
