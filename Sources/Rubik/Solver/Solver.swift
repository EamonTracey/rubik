public class Solver {
    let thistlethwaite = Thistlethwaite()
}

extension Solver {
    public func solve(_ cube: Cube, using method: Method) -> Algorithm {
        switch method {
        case .thistlethwaite:
            return thistlethwaite.solve(cube)
        }
    }
}

extension Solver {
    public func loadTables(for method: Method) {
        switch method {
        case .thistlethwaite:
            thistlethwaite.loadTables()
        }
    }
}

extension Solver {
    public enum Method {
        case thistlethwaite
    }
}
