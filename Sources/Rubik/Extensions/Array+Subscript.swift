extension Array where Element == Cube.Edge {
    @inlinable
    public subscript(index: Element.Position) -> Element {
        get {
            return self[index.rawValue]
        }
        set {
            self[index.rawValue] = newValue
        }
    }
}

extension Array where Element == Cube.Corner {
    @inlinable
    public subscript(index: Element.Position) -> Element {
        get {
            return self[index.rawValue]
        }
        set {
            self[index.rawValue] = newValue
        }
    }
}
