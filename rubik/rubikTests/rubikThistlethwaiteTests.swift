import Foundation
import XCTest

@testable import rubik

final class rubikThistlethwaiteTests: XCTestCase {
    func testStepOne() {
        let algorithmOne: Algorithm
        let algorithmTwo: Algorithm
        
        var cube = Cube.solvedCube
        let scramble = Algorithm("F U L R U' R2 D U' L D2 F' B D2 B' L D' B L2 D B L' R2 U2 L' B'")!
        cube.execute(scramble)
        
        algorithmOne = Thistlethwaite.StepOne.table[Thistlethwaite.StepOne.encodedState(of: cube)]!.reversed
        cube.execute(algorithmOne)
        algorithmTwo = Thistlethwaite.StepTwo.table[Thistlethwaite.StepTwo.encodedState(of: cube)]!.reversed
        cube.execute(algorithmTwo)
        
        print(algorithmOne.appending(contentsOf: algorithmTwo).rawValue)
    }
    
    func testStepThree() {
        let algorithm: Algorithm
        
        var cube = Cube.solvedCube
        let scramble = Algorithm("U F2 D' B2 R2 L2 F2 U' D2 R2 D U L2 D2 F2 R2 U' L2 D2 U")!
        cube.execute(scramble)
        
        print(Thistlethwaite.StepThree.table.count)
        algorithm = Thistlethwaite.StepThree.table[Thistlethwaite.StepThree.encodedState(of: cube)]!.reversed
        
        print(algorithm.rawValue)
    }
}
