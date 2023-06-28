public class Solver {
    @inlinable
    public func solve(_ cube: Cube, using method: Solver.Method) -> Algorithm {
        switch method {
        case .thistlethwaite:
            return self.solveThistlethwaite(cube)
        }
    }
}

extension Solver {
    public enum Method {
        case thistlethwaite
    }
}
