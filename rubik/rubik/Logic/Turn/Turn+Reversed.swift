extension Turn {
    fileprivate static let reverseMap: [Turn:Turn] = [
        .up(.clockwise): .up(.counterclockwise),
        .up(.half): .up(.half),
        .up(.counterclockwise): .up(.clockwise),
        .down(.clockwise): .down(.counterclockwise),
        .down(.half): .down(.half),
        .down(.counterclockwise): .down(.clockwise),
        .right(.clockwise): .right(.counterclockwise),
        .right(.half): .right(.half),
        .right(.counterclockwise): .right(.clockwise),
        .left(.clockwise): .left(.counterclockwise),
        .left(.half): .left(.half),
        .left(.counterclockwise): .left(.clockwise),
        .front(.clockwise): .front(.counterclockwise),
        .front(.half): .front(.half),
        .front(.counterclockwise): .front(.clockwise),
        .back(.clockwise): .back(.counterclockwise),
        .back(.half): .back(.half),
        .back(.counterclockwise): .back(.clockwise),
    ]
    
    var reversed: Turn {
        return Turn.reverseMap[self]!
    }
}
