extension Turn {
    fileprivate static let reverseMap: [TurnDegree:TurnDegree] = [
        .clockwise: .counterclockwise,
        .half: .half,
        .counterclockwise: .clockwise
    ]
    
    var reversed: Turn {
        switch self {
        case .up(let degree):
            return .up(Turn.reverseMap[degree]!)
        case .down(let degree):
            return .down(Turn.reverseMap[degree]!)
        case .right(let degree):
            return .right(Turn.reverseMap[degree]!)
        case .left(let degree):
            return .left(Turn.reverseMap[degree]!)
        case .front(let degree):
            return .front(Turn.reverseMap[degree]!)
        case .back(let degree):
            return .back(Turn.reverseMap[degree]!)
        }
    }
}
