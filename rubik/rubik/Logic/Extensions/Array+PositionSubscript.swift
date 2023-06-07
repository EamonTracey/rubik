extension Array where Element == Edge {
    subscript(index: EdgePosition) -> Edge {
        get {
            return self[Int(index.rawValue)]
        }
        set {
            self[Int(index.rawValue)] = newValue
        }
    }
}

extension Array where Element == Corner {
    subscript(index: CornerPosition) -> Corner {
        get {
            return self[Int(index.rawValue)]
        }
        set {
            self[Int(index.rawValue)] = newValue
        }
    }
}
