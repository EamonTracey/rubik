extension Solver {
    /// Solve a cube.
    ///
    /// - Parameters:
    ///     - cube: The cube to be solved.
    ///     - method: The method to use to solve the cube.
    ///
    /// - Returns: A result structure indicating either success or failure. When successful, the algorithm
    /// generated that solves the cube is returned. Otherwise, an appropriate error is returned.
    ///
    /// This function is capable of solving a cube in any of its 43,252,003,274,489,856,000 unique states. A
    /// successful return guarantees that a correct solution was found.
    ///
    /// There are many reasons for possible failure. First, the cube may be unsolvable (e.g., a corner twist).
    /// Second, the cube may be invalid (e.g., 7 corners when 8 are required). Third, tables may have been
    /// corrupted. In the last case, the package should be reinstalled.
    ///
    /// Example usage to generate a solution for the scramble encountered by Max Park in his world record
    /// solve of 3.13 seconds:
    ///
    /// ```swift
    /// var cube: Cube = .solvedCube
    /// let scramble = Algorithm("D R' U2 F2 D U' B2 R2 L' F U' B2 U2 F L F' D'")!
    ///
    /// cube.execute(scramble)
    ///
    /// let solver = Solver()
    ///
    /// // Explicitly loading the tables is optional.
    /// solver.loadTables(for: .thistlethwaite)
    ///
    /// let result = solver.solve(cube, using: .thistlethwaite)
    /// switch result {
    /// case .success(let solution):
    ///     print("A solution was found: \(solution.stringNotation).")
    ///     print("The solution has \(solution.turns.count) turns.")
    /// case .failure(let error):
    ///     print("Failed to find a solution for the following reason: \(error).")
    /// }
    /// ```
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

extension Solver {
    /// A method to solve a cube.
    public enum Method {
        case thistlethwaite
    }
}

/// An error that corresponds to the failure to solve a cube.
public enum SolveError: Error {
    case invalidCube
    case unsolvableEdgeOrientation
    case unsolvableCornerOrientation
    case unsolvablePermutation
    case corruptedTables
}
