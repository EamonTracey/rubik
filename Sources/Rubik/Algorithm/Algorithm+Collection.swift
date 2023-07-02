extension Algorithm: Collection {
    public typealias Index = Int
    public typealias Element = Turn
    public typealias SubSequence = Slice<Self>

    public subscript(index: Index) -> Element {
        get {
            return turns[index]
        }
    }

    public var startIndex: Index {
        return turns.startIndex
    }

    public var endIndex: Index {
        return turns.endIndex
    }

    public func index(after i: Int) -> Int {
        return turns.index(after: i)
    }
}

extension Algorithm: RangeReplaceableCollection {
    public init() {
        self = Algorithm([])
    }

    public mutating func replaceSubrange<C>(
        _ subrange: Range<Int>,
        with newElements: C
    ) where C: Collection, Turn == C.Element {
        turns.replaceSubrange(subrange, with: newElements)
    }
}

extension Algorithm {
    mutating func sanitize() {
        // TODO: Implement
    }
}
