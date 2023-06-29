public class Solver {
    let thistlethwaite = Thistlethwaite()
}

extension Solver {
    public func solve(_ cube: Cube, using method: Method) -> Result<Algorithm, SolveError> {
        if !cube.isValid {
            return .failure(.invalidCube)
        }
        if !cube.areEdgesOrientable {
            return .failure(.unsolvableEdgeOrientation)
        }
        if !cube.areCornersOrientable {
            return .failure(.unsolvableCornerOrientation)
        }
        if !cube.isPermutable {
            return .failure(.unsolvablePermutation)
        }
        
        switch method {
        case .thistlethwaite:
            if let solution = thistlethwaite.solve(cube) {
                return .success(solution)
            }
            return .failure(.corruptedTables)
        }
    }
}

public enum SolveError: Error {
    case invalidCube
    case unsolvableEdgeOrientation
    case unsolvableCornerOrientation
    case unsolvablePermutation
    case corruptedTables
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
