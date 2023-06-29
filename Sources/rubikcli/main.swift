import Foundation
@testable import Rubik

let solver = Solver()
let table = Solver.Thistlethwaite.Four.generateTable().mapValues { $0.stringNotation }
let data = try! JSONEncoder().encode(table)
try! data.write(to: URL.init(fileURLWithPath: "thistlethwaite_four.json"))
