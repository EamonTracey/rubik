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
        var algorithm: Algorithm
        
        var cube = Cube.solvedCube
        let scramble = Algorithm("U F2 D' B2 R2 L2 F2 U' D2 R2 D U L2 D2 F2 R2 U' L2 D2 U")!
        cube.execute(scramble)
        
        print(Thistlethwaite.StepThree.table.count)
        algorithm = Thistlethwaite.StepThree.table[Thistlethwaite.StepThree.encodedState(of: cube)]!.reversed
        print(algorithm.rawValue)
        cube.execute(algorithm)
        
        print(Thistlethwaite.StepFour.table.count)
        algorithm = Thistlethwaite.StepFour.table[Thistlethwaite.StepFour.encodedState(of: cube)]!.reversed
        print(algorithm.rawValue)
    }
    
    func testFullSolve() {
        let algorithm1: Algorithm
        let algorithm2: Algorithm
        let algorithm3: Algorithm
        let algorithm4: Algorithm
        
        var cube = Cube.solvedCube
        cube.execute(Algorithm("L2 R2 U' B2 D R' B' R' U B' F' L2 R2 B2 D' F R' D2 U2 B L2 R2 F2 R U'")!)
        print("Scrambled")
        
        algorithm1 = Thistlethwaite.StepOne.table[Thistlethwaite.StepOne.encodedState(of: cube)]!.reversed
        cube.execute(algorithm1)
        print("Step 1 completed")
        
        algorithm2 = Thistlethwaite.StepTwo.table[Thistlethwaite.StepTwo.encodedState(of: cube)]!.reversed
        cube.execute(algorithm2)
        print("Step 2 completed")
        
        algorithm3 = Thistlethwaite.StepThree.table[Thistlethwaite.StepThree.encodedState(of: cube)]!.reversed
        cube.execute(algorithm3)
        print("Step 3 completed")
        
        algorithm4 = Thistlethwaite.StepFour.table[Thistlethwaite.StepFour.encodedState(of: cube)]!.reversed
        cube.execute(algorithm4)
        print("Step 4 completed")
        
        print(cube)
        print(algorithm1.appending(contentsOf: algorithm2).appending(contentsOf: algorithm3).appending(contentsOf: algorithm4).rawValue)
        // R2 U' F' R U2 L2 F2 U' L' F2 R2 D' L2 U B2 U R2 R2 D2 L2 B2 U2 B2 D2 R2 F2 R2 F2 U2
    }
}
