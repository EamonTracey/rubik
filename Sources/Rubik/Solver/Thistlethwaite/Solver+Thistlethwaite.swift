import Foundation

extension Solver {
    internal class Thistlethwaite {
        private var tableOne: [Int: String]? = nil
        private var tableTwo: [Int: String]? = nil
        private var tableThree: [Int: String]? = nil
        private var tableFour: [Int: String]? = nil
        private var tablesLoaded: Bool = false
    }
}

extension Solver.Thistlethwaite {
    @usableFromInline
    internal func solve(_ cube: Cube) -> Algorithm {
        if !tablesLoaded {
            loadTables()
        }
        
        let one = tableOne![One.encode(cube)]!
        let two = tableTwo![Two.encode(cube)]!
//        let three = tableThree![Three.encode(cube)]!
//        let four = tableFour![Four.encode(cube)]!
        
        return Algorithm("\(one) \(two)")!
    }
}

extension Solver.Thistlethwaite {
    @usableFromInline
    internal func loadTable(_ step: String) -> [Int: String]? {
        if let url = Bundle.module.url(forResource: "Tables/thistlethwaite_\(step)", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let dict = try? JSONDecoder().decode([Int: String].self, from: data) {
            return dict
        }
        return nil
    }
}

extension Solver.Thistlethwaite {
    @usableFromInline
    internal func loadTables() {
        tableOne = loadTable("one") ?? One.generateTable().mapValues { $0.stringNotation }
        tableTwo = loadTable("two") ?? Two.generateTable().mapValues { $0.stringNotation }
        tableThree = loadTable("three") ?? Three.generateTable().mapValues { $0.stringNotation }
        tableFour = loadTable("four") ?? Four.generateTable().mapValues { $0.stringNotation }
        tablesLoaded = true
    }
    
    @usableFromInline
    internal func unloadTables() {
        tableOne = nil
        tableTwo = nil
        tableThree = nil
        tableFour = nil
    }
}
