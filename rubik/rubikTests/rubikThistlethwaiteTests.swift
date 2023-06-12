import Foundation
import XCTest

@testable import rubik

final class rubikThistlethwaiteTests: XCTestCase {
    func testStepOne() {
        var algorithmOne: Algorithm! = nil
        var algorithmTwo: Algorithm! = nil
        
        var cube = Cube.solvedCube
        let scramble = Algorithm("F U L R U' R2 D U' L D2 F' B D2 B' L D' B L2 D B L' R2 U2 L' B'")!
        cube.execute(scramble)
        
        algorithmOne = Thistlethwaite.StepOne.table[Thistlethwaite.StepOne.encodedState(of: cube)]!.reversed
        cube.execute(algorithmOne)
        algorithmTwo = Thistlethwaite.StepTwo.table[Thistlethwaite.StepTwo.encodedState(of: cube)]!.reversed
        cube.execute(algorithmTwo)
        
        print(algorithmOne.appending(contentsOf: algorithmTwo).rawValue)
    }
}
