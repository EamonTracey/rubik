extension Solver {
    /// Load tables for a method from disk.
    ///
    /// - Parameters:
    ///     - method: The method for which tables will be loaded.
    ///
    /// - Note: When calling ``solve(_:using:)`` for a particular method, the tables for that
    /// method will be loaded. Therefore, you never need to explicitly load tables. However, since loading
    /// tables from disk may be an expensive operation, you may want to preload the tables before calling
    /// ``solve(_:using:)``.
    @inlinable
    public func loadTables(for method: Method) {
        switch method {
        case .thistlethwaite:
            thistlethwaite.loadTables()
        default:
            break
        }
    }

    /// Unload tables for a method.
    ///
    /// - Parameters:
    ///     - method: The method for which tables will be unloaded.
    ///
    /// - Note: Once tables are loaded, they will not be unloaded unless this method is explicitly called,
    /// or the solver instance is dereferenced. If you want to retain a solver instance but take back memory,
    /// call this method.
    @inlinable
    public func unloadTables(for method: Method) {
        switch method {
        case .thistlethwaite:
            thistlethwaite.unloadTables()
        default:
            break
        }
    }
}
