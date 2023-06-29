public class Solver {
    let thistlethwaite = Thistlethwaite()
}

extension Solver {
    public func solve(_ cube: Cube, using method: Solver.Method) -> Algorithm {
        switch method {
        case .thistlethwaite:
            return self.thistlethwaite.solve(cube)
        }
    }
}

extension Solver {
    public func loadTables(for method: Solver.Method) {
        switch method {
        case .thistlethwaite:
            self.thistlethwaite.loadTables()
        }
    }
}

extension Solver {
    public enum Method {
        case thistlethwaite
    }
}
