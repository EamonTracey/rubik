import XCTest
@testable import Rubik

import Foundation

final class RubikTests: XCTestCase {
    func testExample() {
        let solver = Solver()
         
//        let scramble = Algorithm("D U F2 L2 U' B2 F2 D L2 U R' F' D R' F' U L D' F' D R2")!
        let scramble = Algorithm("L F D' L D2 F B2 D B2 D2 F' D2 U' R2 F R' F2 R' D B' F2 R' F' D' F")!
        var cube = Cube.solvedCube
        cube.execute(scramble)
        
//        let table1 = solver.generateThistlethwaiteOneTable()
//        print("Step 1 table size: \(table1.count)")
//        let sol1 = table1[encodeThistlethwaiteOne(cube)]!.reversed
//        print("Step 1: \(sol1.stringNotation)")
//        cube.execute(sol1)
//
//        let table2 = solver.generateThistlethwaiteTwoTable()
//        print("Step 2 table size: \(table2.count)")
//        let sol2 = table2[encodeThistlethwaiteTwo(cube)]!.reversed
//        print("Step 2: \(sol2.stringNotation)")
//        cube.execute(sol2)
//        
//        let table3 = solver.generateThistlethwaiteThreeTable()
//        print("Step 3 table size: \(table3.count)")
//        let sol3 = table3[encodeThistlethwaiteThree(cube)]!.reversed
//        print("Step 3: \(sol3.stringNotation)")
//        cube.execute(sol3)
        
        let table4 = solver.generateThistlethwaiteFourTable()
        print("Step 4 table size: \(table4.count)")
        let sol4 = table4[encodeThistlethwaiteFour(cube)]!.reversed
        print("Step 4: \(sol4.stringNotation)")
        cube.execute(sol4)
    }
}
