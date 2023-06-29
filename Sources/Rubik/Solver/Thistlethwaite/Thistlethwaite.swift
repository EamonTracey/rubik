import Foundation

extension Solver {
    class Thistlethwaite {
        private var tableOne: [Int: String]?
        private var tableTwo: [Int: String]?
        private var tableThree: [Int: String]?
        private var tableFour: [Int: String]?
        private var tablesLoaded: Bool = false
    }
}

extension Solver.Thistlethwaite {
    @usableFromInline
    func solve(_ cube: Cube) -> Algorithm {
        if !tablesLoaded {
            loadTables()
        }

        var cube = cube

        let one = tableOne![One.encode(cube)]!
        cube.execute(Algorithm(one)!)
        let two = tableTwo![Two.encode(cube)]!
        cube.execute(Algorithm(two)!)
        let three = tableThree![Three.encode(cube)]!
        cube.execute(Algorithm(three)!)
        let four = tableFour![Four.encode(cube)]!
        cube.execute(Algorithm(four)!)

        return Algorithm("\(one) \(two) \(three) \(four)")!
    }
}

extension Solver.Thistlethwaite {
    @usableFromInline
    func loadTables() {
        tableOne = One.loadTable() ?? One.generateTable()
        tableTwo = Two.loadTable() ?? Two.generateTable()
        tableThree = Three.loadTable() ?? Three.generateTable()
        tableFour = Four.loadTable() ?? Four.generateTable()
        tablesLoaded = true
    }

    @usableFromInline
    func unloadTables() {
        tableOne = nil
        tableTwo = nil
        tableThree = nil
        tableFour = nil
    }
}
