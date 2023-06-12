import Foundation
import XCTest

@testable import rubik

final class rubikThistlethwaiteTests: XCTestCase {
    func testStepOne() {
        var cube = Cube.solvedCube
        let scramble = Algorithm("R2 U' B' L2 R2 U' L B2 L' B2 D' F2 L B2 F' U2 R' B' F' U' F2 L' U D R")!
        cube.execute(scramble)
        
        let stepOneAlgorithm = Thistlethwaite.StepOne.table[cube.edgeOrientation]
        print(stepOneAlgorithm?.reversed.rawValue ?? "Error!")
    }
}
