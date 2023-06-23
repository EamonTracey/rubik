public class Solver {
    @inlinable
    public func solve(_ cube: Cube, using method: SolveMethod) -> Algorithm {
        switch method {
        case .thistlethwaite:
            return self.solveThistlethwaite(cube)
        }
    }
}

public enum SolveMethod {
    case thistlethwaite
}

public extension Solver {
    @inlinable
    func solveThistlethwaite(_ cube: Cube) -> Algorithm {
        var algorithm: Algorithm = .nothing
        
        return algorithm
    }
}
