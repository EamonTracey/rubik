import Foundation

extension Solver {
    class Thistlethwaite {
        private var tableOne: [String]?
        private var tableTwo: [String]?
        private var tableThree: [String]?
        private var tableFour: [String]?
        private var tablesLoaded: Bool = false
    }
}

extension Solver.Thistlethwaite {
    @usableFromInline
    func solve(_ cube: Cube) -> Algorithm? {
        if !tablesLoaded {
            loadTables()
        }

        var cube = cube

        guard let one = tableOne?[One.encode(cube)] else { return nil }
        guard let oneAlgorithm = Algorithm(one) else { return nil }
        cube.execute(oneAlgorithm)

        guard let two = tableTwo?[Two.encode(cube)] else { return nil }
        guard let twoAlgorithm = Algorithm(two) else { return nil }
        cube.execute(twoAlgorithm)

        guard let three = tableThree?[Three.encode(cube)] else { return nil }
        guard let threeAlgorithm = Algorithm(three) else { return nil }
        cube.execute(threeAlgorithm)

        guard let four = tableFour?[Four.encode(cube)] else { return nil }
        guard let fourAlgorithm = Algorithm(four) else { return nil }
        cube.execute(fourAlgorithm)

        return Algorithm("\(one) \(two) \(three) \(four)")
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
